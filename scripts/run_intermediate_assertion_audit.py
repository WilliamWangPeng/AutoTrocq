from __future__ import annotations

import argparse
import csv
import itertools
import json
from pathlib import Path


Carrier = tuple[int, ...]
Relation = frozenset[tuple[int, int]]
Predicate = frozenset[int]


def powerset(items: tuple[object, ...]) -> list[frozenset[object]]:
    return [
        frozenset(selection)
        for size in range(len(items) + 1)
        for selection in itertools.combinations(items, size)
    ]


def compose(carrier: Carrier, first: Relation, second: Relation) -> Relation:
    return frozenset(
        (a, c)
        for a in carrier
        for c in carrier
        if any((a, b) in first and (b, c) in second for b in carrier)
    )


def weakest_pre(carrier: Carrier, relation: Relation, post: Predicate) -> Predicate:
    return frozenset(
        a
        for a in carrier
        if all(b in post for b in carrier if (a, b) in relation)
    )


def strongest_post(carrier: Carrier, relation: Relation, pre: Predicate) -> Predicate:
    return frozenset(
        b
        for b in carrier
        if any(a in pre and (a, b) in relation for a in carrier)
    )


def valid(relation: Relation, pre: Predicate, post: Predicate) -> bool:
    return all(a not in pre or b in post for a, b in relation)


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Exhaustively check intermediate-assertion and refinement laws."
    )
    parser.add_argument(
        "--out", type=Path, default=Path("artifact/intermediate_assertions")
    )
    args = parser.parse_args()

    carrier: Carrier = (0, 1)
    edges = tuple((a, b) for a in carrier for b in carrier)
    relations = [frozenset(r) for r in powerset(edges)]
    predicates = [frozenset(p) for p in powerset(tuple(carrier))]
    mismatches: list[dict[str, str]] = []

    interval_cases = 0
    existence_cases = 0
    refinement_cases = 0

    for first in relations:
        for second in relations:
            composite = compose(carrier, first, second)
            for pre in predicates:
                sp = strongest_post(carrier, first, pre)
                for post in predicates:
                    wp = weakest_pre(carrier, second, post)
                    composite_valid = valid(composite, pre, post)
                    witness_exists = False
                    existence_cases += 1
                    for middle in predicates:
                        interval_cases += 1
                        stage_valid = valid(first, pre, middle) and valid(
                            second, middle, post
                        )
                        interval_valid = sp <= middle and middle <= wp
                        witness_exists = witness_exists or stage_valid
                        if stage_valid != interval_valid:
                            mismatches.append(
                                {
                                    "law": "intermediate_interval",
                                    "observed": str(stage_valid),
                                    "expected": str(interval_valid),
                                }
                            )
                    if composite_valid != witness_exists:
                        mismatches.append(
                            {
                                "law": "intermediate_exists",
                                "observed": str(witness_exists),
                                "expected": str(composite_valid),
                            }
                        )

    refinement_pairs = [
        (narrow, broad)
        for narrow in relations
        for broad in relations
        if narrow <= broad
    ]
    for first_narrow, first_broad in refinement_pairs:
        for second_narrow, second_broad in refinement_pairs:
            broad_composite = compose(carrier, first_broad, second_broad)
            narrow_composite = compose(carrier, first_narrow, second_narrow)
            for pre in predicates:
                for post in predicates:
                    refinement_cases += 1
                    expected = (not valid(broad_composite, pre, post)) or valid(
                        narrow_composite, pre, post
                    )
                    if not expected:
                        mismatches.append(
                            {
                                "law": "composition_refinement",
                                "observed": "false",
                                "expected": "true",
                            }
                        )

    args.out.mkdir(parents=True, exist_ok=True)
    fields = ["law", "observed", "expected"]
    with (args.out / "mismatches.csv").open(
        "w", encoding="utf-8", newline=""
    ) as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(mismatches)

    summary = {
        "schema_version": 1,
        "carrier_size": len(carrier),
        "relations": len(relations),
        "predicates": len(predicates),
        "refinement_pairs": len(refinement_pairs),
        "intermediate_interval_cases": interval_cases,
        "intermediate_existence_cases": existence_cases,
        "composition_refinement_cases": refinement_cases,
        "total_cases": interval_cases + existence_cases + refinement_cases,
        "mismatches": len(mismatches),
        "status": "success" if not mismatches else "failure",
    }
    (args.out / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(summary, indent=2, sort_keys=True))
    return 0 if not mismatches else 1


if __name__ == "__main__":
    raise SystemExit(main())
