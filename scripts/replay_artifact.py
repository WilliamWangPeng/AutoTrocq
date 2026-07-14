from __future__ import annotations

import argparse
import csv
import json
import shutil
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path


QUICK_SUITES = ("policy-stress", "relation-strength", "large-generated", "case-studies")
FULL_SUITES = QUICK_SUITES + ("scaling",)


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


def main() -> int:
    parser = argparse.ArgumentParser(description="Replay the curated AutoTrocq Coq corpus")
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
        help="reuse a .vo only when it is at least as new as its .v source",
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

    suites = QUICK_SUITES if args.profile == "quick" else FULL_SUITES
    rows: list[dict[str, object]] = []
    checks: list[dict[str, object]] = []
    for suite in suites:
        suite_root = artifact / suite
        sources = sorted(suite_root.rglob("*.v"))

        def compile_source(source: Path) -> tuple[dict[str, object], str]:
            compiled = source.with_suffix(".vo")
            reusable = (
                args.reuse_compiled
                and compiled.exists()
                and compiled.stat().st_mtime_ns >= source.stat().st_mtime_ns
            )
            if reusable:
                code, elapsed, output = 0, 0.0, "reused current .vo\n"
            else:
                code, elapsed, output = run(["coqc", "-q", source.name], source.parent)
            log_path = out / suite / source.relative_to(suite_root).with_suffix(".coqc.log")
            log_path.parent.mkdir(parents=True, exist_ok=True)
            log_path.write_text(output, encoding="utf-8")
            return ({
                "suite": suite,
                "file": source.relative_to(artifact).as_posix(),
                "module": source.stem,
                "coqc_status": (
                    "kernel_success_reused" if reusable
                    else "kernel_success" if code == 0
                    else "kernel_failure"
                ),
                "coqc_seconds": round(elapsed, 6),
                "coqc_returncode": code,
            }, output)

        with ThreadPoolExecutor(max_workers=max(1, args.jobs)) as executor:
            compiled = list(executor.map(compile_source, sources))
        suite_rows = [item[0] for item in compiled]
        rows.extend(suite_rows)
        modules_by_dir: dict[Path, list[str]] = {}
        for source, row in zip(sources, suite_rows):
            if row["coqc_returncode"] == 0:
                modules_by_dir.setdefault(source.parent, []).append(source.stem)
        for directory, modules in modules_by_dir.items():
            code, elapsed, output = run(["coqchk", *modules], directory)
            rel_dir = directory.relative_to(suite_root)
            log_path = out / suite / rel_dir / "batch.coqchk.log"
            log_path.parent.mkdir(parents=True, exist_ok=True)
            log_path.write_text(output, encoding="utf-8")
            checks.append({
                "suite": suite,
                "directory": rel_dir.as_posix(),
                "modules": len(modules),
                "coqchk_status": "coqchk_success" if code == 0 else "coqchk_failure",
                "coqchk_seconds": round(elapsed, 6),
                "coqchk_returncode": code,
            })

    with (out / "coqc_results.csv").open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    with (out / "coqchk_results.csv").open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(checks[0]))
        writer.writeheader()
        writer.writerows(checks)

    failures = sum(row["coqc_returncode"] != 0 for row in rows)
    reused = sum(row["coqc_status"] == "kernel_success_reused" for row in rows)
    check_failures = sum(row["coqchk_returncode"] != 0 for row in checks)
    summary = {
        "profile": args.profile,
        "suites": list(suites),
        "modules": len(rows),
        "coqc_success": len(rows) - failures,
        "coqc_failure": failures,
        "coqc_compiled": len(rows) - failures - reused,
        "coqc_reused": reused,
        "coqchk_batches": len(checks),
        "coqchk_success": len(checks) - check_failures,
        "coqchk_failure": check_failures,
        "status": "success" if failures == 0 and check_failures == 0 else "failure",
    }
    (out / "summary.json").write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=2, sort_keys=True))
    return 0 if summary["status"] == "success" else 1


if __name__ == "__main__":
    raise SystemExit(main())
