from __future__ import annotations

import argparse
import csv
import itertools
import json
from pathlib import Path

from autotrocq.core import composition_policy_decision


def powerset(items: tuple[str, ...]) -> list[set[str]]:
    return [
        set(selection)
        for size in range(len(items) + 1)
        for selection in itertools.combinations(items, size)
    ]


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Exhaustively compare composed-policy decisions with stagewise admission."
    )
    parser.add_argument("--axioms", type=int, default=5)
    parser.add_argument("--out", type=Path, default=Path("artifact/composition_policy"))
    args = parser.parse_args()
    if args.axioms < 1:
        parser.error("--axioms must be positive")

    universe = tuple(f"a{i}" for i in range(args.axioms))
    subsets = powerset(universe)
    mismatches: list[dict[str, str]] = []
    cases = 0
    accepted = 0
    blocked = 0

    for first_required in subsets:
        for second_required in subsets:
            specs = [
                {"required_axioms": sorted(first_required)},
                {"required_axioms": sorted(second_required)},
            ]
            for allowed in subsets:
                cases += 1
                decision = composition_policy_decision(specs, sorted(allowed))
                observed = decision.outcome == "accept"
                expected = first_required <= allowed and second_required <= allowed
                if observed:
                    accepted += 1
                else:
                    blocked += 1
                if observed != expected:
                    mismatches.append(
                        {
                            "first_required": ";".join(sorted(first_required)),
                            "second_required": ";".join(sorted(second_required)),
                            "allowed": ";".join(sorted(allowed)),
                            "observed": decision.outcome,
                            "expected": "accept" if expected else "safe_reject",
                        }
                    )

    args.out.mkdir(parents=True, exist_ok=True)
    mismatch_path = args.out / "mismatches.csv"
    fields = ["first_required", "second_required", "allowed", "observed", "expected"]
    with mismatch_path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(mismatches)

    summary = {
        "schema_version": 1,
        "axiom_universe_size": len(universe),
        "subsets": len(subsets),
        "cases": cases,
        "accepted": accepted,
        "blocked": blocked,
        "mismatches": len(mismatches),
        "status": "success" if not mismatches else "failure",
        "law": "union(E1,E2) subset Pi iff E1 subset Pi and E2 subset Pi",
    }
    (args.out / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(summary, indent=2, sort_keys=True))
    return 0 if not mismatches else 1


if __name__ == "__main__":
    raise SystemExit(main())
