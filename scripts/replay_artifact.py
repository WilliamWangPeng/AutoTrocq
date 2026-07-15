from __future__ import annotations

import argparse
import csv
import json
import shutil
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path


SUITES = (
    ("V43", "minimal-replay"),
    ("V44", "seed-suite"),
    ("V45", "generated-seed"),
    ("V50", "policy-stress"),
    ("V51", "relation-strength"),
    ("V58", "large-generated"),
    ("V59", "scaling"),
    ("V60", "case-studies"),
    ("V63", "library-migration"),
    ("V64", "robustness-matrix"),
    ("V65", "stdlib-interop"),
    ("V66", "proof-maintenance"),
    ("V70", "third-party-idiom"),
)
QUICK_CODES = {"V50", "V51", "V58", "V60"}


def run(command: list[str], cwd: Path) -> tuple[int, float, str]:
    start = time.perf_counter()
    proc = subprocess.run(
        command,
        cwd=cwd,
        text=True,
        encoding="utf-8",
        errors="replace",
        capture_output=True,
        check=False,
    )
    return proc.returncode, time.perf_counter() - start, (proc.stdout or "") + (proc.stderr or "")


def read_ledger(artifact: Path) -> list[dict[str, str]]:
    path = artifact / "strict-outcome-audit" / "strict_outcome_ledger.csv"
    if not path.is_file():
        raise SystemExit(f"strict outcome ledger is missing: {path}")
    with path.open("r", encoding="utf-8-sig", newline="") as handle:
        return list(csv.DictReader(handle))


def main() -> int:
    parser = argparse.ArgumentParser(description="Replay the outcome-aware AutoTrocq Coq corpus")
    parser.add_argument("--profile", choices=("quick", "full"), default="quick")
    parser.add_argument("--artifact", type=Path)
    parser.add_argument("--out", type=Path)
    parser.add_argument(
        "--jobs",
        type=int,
        default=1,
        help="number of concurrent coqc processes (default: 1 for reproducibility)",
    )
    parser.add_argument(
        "--reuse-compiled",
        action="store_true",
        help="reuse a copied .vo only when it is at least as new as its .v source",
    )
    args = parser.parse_args()
    if args.jobs < 1:
        parser.error("--jobs must be at least 1")
    root = Path(__file__).resolve().parents[1]
    artifact = (args.artifact or root / "artifact").resolve()
    out = (args.out or root / "build" / f"artifact-{args.profile}").resolve()
    out.mkdir(parents=True, exist_ok=True)
    if not shutil.which("coqc") or not shutil.which("coqchk"):
        raise SystemExit("coqc and coqchk must both be available on PATH")

    selected = tuple(item for item in SUITES if args.profile == "full" or item[0] in QUICK_CODES)
    selected_codes = {code for code, _ in selected}
    ledger = [row for row in read_ledger(artifact) if row["suite"] in selected_codes]
    by_module = {(row["suite"], row["module"]): row for row in ledger if row["module"]}
    rows: list[dict[str, object]] = []
    checks: list[dict[str, object]] = []
    audit_errors: list[str] = []

    for code, suite in selected:
        suite_root = artifact / suite
        sources = sorted(suite_root.rglob("*.v"))
        work_root = out / "work" / suite
        source_records: list[tuple[Path, Path, str]] = []
        for source in sources:
            ledger_row = by_module.get((code, source.stem))
            if ledger_row is None:
                audit_errors.append(f"{code}/{source.stem}: no strict-ledger outcome")
                continue
            expected = ledger_row["final_outcome"]
            relative_source = source.relative_to(suite_root)
            copied = work_root / relative_source
            copied.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source, copied)
            source_records.append((source, copied, expected))

        def compile_source(item: tuple[Path, Path, str]) -> dict[str, object]:
            source, copied, expected = item
            if expected == "safe_reject_policy_blocked":
                return {
                    "suite": suite,
                    "file": source.relative_to(artifact).as_posix(),
                    "module": source.stem,
                    "expected_outcome": expected,
                    "observed_outcome": "policy_not_replayed",
                    "coqc_seconds": 0.0,
                    "coqc_returncode": "",
                    "expectation_met": 1,
                }
            compiled = copied.with_suffix(".vo")
            reusable = (
                args.reuse_compiled
                and compiled.exists()
                and compiled.stat().st_mtime_ns >= copied.stat().st_mtime_ns
            )
            if reusable:
                code_value, elapsed, output = 0, 0.0, "reused current .vo\n"
            else:
                code_value, elapsed, output = run(["coqc", "-q", copied.name], copied.parent)
            if expected == "accepted_kernel_checked":
                observed = "coqc_success" if code_value == 0 else "unexpected_coqc_failure"
                met = code_value == 0
            elif expected == "safe_reject_compile_blocked":
                observed = "compile_blocked" if code_value != 0 else "unexpected_coqc_success"
                met = code_value != 0
            else:
                observed = "unexpected_ledger_outcome"
                met = False
            log_path = out / "logs" / suite / source.relative_to(suite_root).with_suffix(".coqc.log")
            log_path.parent.mkdir(parents=True, exist_ok=True)
            log_path.write_text(output, encoding="utf-8")
            return {
                "suite": suite,
                "file": source.relative_to(artifact).as_posix(),
                "module": source.stem,
                "expected_outcome": expected,
                "observed_outcome": observed,
                "coqc_seconds": round(elapsed, 6),
                "coqc_returncode": code_value,
                "expectation_met": int(met),
            }

        with ThreadPoolExecutor(max_workers=max(1, args.jobs)) as executor:
            suite_rows = list(executor.map(compile_source, source_records))
        rows.extend(suite_rows)

        modules_by_dir: dict[Path, list[str]] = {}
        for (_, copied, expected), row in zip(source_records, suite_rows):
            if expected == "accepted_kernel_checked" and row["coqc_returncode"] == 0:
                modules_by_dir.setdefault(copied.parent, []).append(copied.stem)
        for directory, modules in modules_by_dir.items():
            code_value, elapsed, output = run(["coqchk", *modules], directory)
            rel_dir = directory.relative_to(work_root)
            log_path = out / "logs" / suite / rel_dir / "batch.coqchk.log"
            log_path.parent.mkdir(parents=True, exist_ok=True)
            log_path.write_text(output, encoding="utf-8")
            checks.append(
                {
                    "suite": suite,
                    "directory": rel_dir.as_posix(),
                    "modules": len(modules),
                    "coqchk_status": "coqchk_success" if code_value == 0 else "coqchk_failure",
                    "coqchk_seconds": round(elapsed, 6),
                    "coqchk_returncode": code_value,
                }
            )

    row_fields = [
        "suite",
        "file",
        "module",
        "expected_outcome",
        "observed_outcome",
        "coqc_seconds",
        "coqc_returncode",
        "expectation_met",
    ]
    with (out / "coqc_results.csv").open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=row_fields)
        writer.writeheader()
        writer.writerows(rows)
    check_fields = ["suite", "directory", "modules", "coqchk_status", "coqchk_seconds", "coqchk_returncode"]
    with (out / "coqchk_results.csv").open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=check_fields)
        writer.writeheader()
        writer.writerows(checks)

    decision_counts: dict[str, int] = {}
    for row in ledger:
        outcome = row["final_outcome"]
        decision_counts[outcome] = decision_counts.get(outcome, 0) + 1
    source_expectation_failures = sum(not bool(row["expectation_met"]) for row in rows)
    check_failures = sum(row["coqchk_returncode"] != 0 for row in checks)
    accepted_sources = sum(row["expected_outcome"] == "accepted_kernel_checked" for row in rows)
    checked_sources = sum(row["modules"] for row in checks if row["coqchk_returncode"] == 0)
    if accepted_sources != checked_sources:
        audit_errors.append(
            f"accepted-source coverage mismatch: accepted={accepted_sources}, coqchk_checked={checked_sources}"
        )
    summary = {
        "profile": args.profile,
        "suites": [suite for _, suite in selected],
        "decision_requests": len(ledger),
        "source_modules": len(rows),
        "expected_outcomes": dict(sorted(decision_counts.items())),
        "accepted_sources_coqchk_checked": checked_sources,
        "coqchk_batches": len(checks),
        "coqchk_failure": check_failures,
        "source_expectation_failures": source_expectation_failures,
        "audit_errors": audit_errors,
        "status": (
            "success"
            if source_expectation_failures == 0 and check_failures == 0 and not audit_errors
            else "failure"
        ),
    }
    (out / "summary.json").write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=2, sort_keys=True))
    return 0 if summary["status"] == "success" else 1


if __name__ == "__main__":
    raise SystemExit(main())
