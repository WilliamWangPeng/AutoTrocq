from __future__ import annotations

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


def main() -> int:
    carrier: Carrier = (0, 1)
    predicates = [frozenset(x) for x in powerset(tuple(carrier))]
    pairs = tuple((a, b) for a in carrier for b in carrier)
    relations = [frozenset(x) for x in powerset(pairs)]
    mismatches: list[dict[str, str]] = []

    wp_cases = 0
    for first in relations:
        for second in relations:
            composed = compose(carrier, first, second)
            for post in predicates:
                wp_cases += 1
                direct = weakest_pre(carrier, composed, post)
                staged = weakest_pre(
                    carrier, first, weakest_pre(carrier, second, post)
                )
                if direct != staged:
                    mismatches.append(
                        {"law": "wp_composition", "direct": repr(direct), "staged": repr(staged)}
                    )

    sp_cases = 0
    for first in relations:
        for second in relations:
            composed = compose(carrier, first, second)
            for pre in predicates:
                sp_cases += 1
                direct = strongest_post(carrier, composed, pre)
                staged = strongest_post(
                    carrier, second, strongest_post(carrier, first, pre)
                )
                if direct != staged:
                    mismatches.append(
                        {"law": "sp_composition", "direct": repr(direct), "staged": repr(staged)}
                    )

    galois_cases = 0
    for relation in relations:
        for pre in predicates:
            for post in predicates:
                galois_cases += 1
                left = strongest_post(carrier, relation, pre) <= post
                right = pre <= weakest_pre(carrier, relation, post)
                if left != right:
                    mismatches.append(
                        {"law": "sp_wp_galois", "direct": str(left), "staged": str(right)}
                    )

    output = Path("artifact/predicate_transformers")
    output.mkdir(parents=True, exist_ok=True)
    fields = ["law", "direct", "staged"]
    with (output / "mismatches.csv").open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(mismatches)

    summary = {
        "schema_version": 1,
        "carrier_size": len(carrier),
        "relations": len(relations),
        "predicates": len(predicates),
        "weakest_pre_composition_cases": wp_cases,
        "strongest_post_composition_cases": sp_cases,
        "galois_connection_cases": galois_cases,
        "total_cases": wp_cases + sp_cases + galois_cases,
        "mismatches": len(mismatches),
        "status": "success" if not mismatches else "failure",
    }
    (output / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(summary, indent=2, sort_keys=True))
    return 0 if not mismatches else 1


if __name__ == "__main__":
    raise SystemExit(main())
