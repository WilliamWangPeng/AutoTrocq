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


def valid(relation: Relation, pre: Predicate, post: Predicate) -> bool:
    return all(a not in pre or b in post for a, b in relation)


def strongest_post(relation: Relation, pre: Predicate) -> Predicate:
    return frozenset(b for a, b in relation if a in pre)


def weakest_pre(carrier: Carrier, relation: Relation, post: Predicate) -> Predicate:
    return frozenset(
        a
        for a in carrier
        if all(b in post for x, b in relation if x == a)
    )


def compose(carrier: Carrier, first: Relation, second: Relation) -> Relation:
    return frozenset(
        (a, c)
        for a in carrier
        for c in carrier
        if any((a, b) in first and (b, c) in second for b in carrier)
    )


def record(
    mismatches: list[dict[str, str]], law: str, observed: bool, expected: bool
) -> None:
    if observed != expected:
        mismatches.append(
            {"law": law, "observed": str(observed), "expected": str(expected)}
        )


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Exhaustively check contextual full abstraction laws."
    )
    parser.add_argument(
        "--out", type=Path, default=Path("artifact/full_abstraction")
    )
    args = parser.parse_args()

    carrier: Carrier = (0, 1)
    edges = tuple((a, b) for a in carrier for b in carrier)
    relations = [frozenset(r) for r in powerset(edges)]
    predicates = [frozenset(p) for p in powerset(tuple(carrier))]
    mismatches: list[dict[str, str]] = []

    validity_context_checks = 0
    strongest_post_checks = 0
    weakest_pre_checks = 0
    equivalence_context_checks = 0
    strongest_post_extensionality_checks = 0
    weakest_pre_extensionality_checks = 0
    separating_edge_checks = 0

    for narrow in relations:
        for broad in relations:
            refines = narrow <= broad

            validity_included = True
            same_validity = True
            for pre in predicates:
                for post in predicates:
                    validity_context_checks += 1
                    broad_valid = valid(broad, pre, post)
                    narrow_valid = valid(narrow, pre, post)
                    validity_included &= (not broad_valid) or narrow_valid

                    equivalence_context_checks += 1
                    same_validity &= broad_valid == narrow_valid

            sp_order = True
            sp_extensional = True
            for pre in predicates:
                strongest_post_checks += 1
                sp_narrow = strongest_post(narrow, pre)
                sp_broad = strongest_post(broad, pre)
                sp_order &= sp_narrow <= sp_broad

                strongest_post_extensionality_checks += 1
                sp_extensional &= sp_narrow == sp_broad

            wp_order = True
            wp_extensional = True
            for post in predicates:
                weakest_pre_checks += 1
                wp_narrow = weakest_pre(carrier, narrow, post)
                wp_broad = weakest_pre(carrier, broad, post)
                wp_order &= wp_broad <= wp_narrow

                weakest_pre_extensionality_checks += 1
                wp_extensional &= wp_narrow == wp_broad

            record(mismatches, "refinement_validity_theory", validity_included, refines)
            record(mismatches, "refinement_strongest_post", sp_order, refines)
            record(mismatches, "refinement_weakest_pre", wp_order, refines)
            record(mismatches, "equivalence_validity_theory", same_validity, narrow == broad)
            record(mismatches, "equivalence_strongest_post", sp_extensional, narrow == broad)
            record(mismatches, "equivalence_weakest_pre", wp_extensional, narrow == broad)

            for a, b in narrow - broad:
                separating_edge_checks += 1
                pre = frozenset({a})
                post = frozenset(y for y in carrier if (a, y) in broad)
                separates = valid(broad, pre, post) and not valid(narrow, pre, post)
                record(mismatches, "missing_edge_separator", separates, True)

    refinement_pairs = [
        (narrow, broad)
        for narrow in relations
        for broad in relations
        if narrow <= broad
    ]
    composition_refinement_checks = 0
    for first_narrow, first_broad in refinement_pairs:
        for second_narrow, second_broad in refinement_pairs:
            composition_refinement_checks += 1
            observed = compose(carrier, first_narrow, second_narrow) <= compose(
                carrier, first_broad, second_broad
            )
            record(mismatches, "composition_refinement", observed, True)

    args.out.mkdir(parents=True, exist_ok=True)
    fields = ["law", "observed", "expected"]
    with (args.out / "mismatches.csv").open(
        "w", encoding="utf-8", newline=""
    ) as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(mismatches)

    total_checks = (
        validity_context_checks
        + strongest_post_checks
        + weakest_pre_checks
        + equivalence_context_checks
        + strongest_post_extensionality_checks
        + weakest_pre_extensionality_checks
        + separating_edge_checks
        + composition_refinement_checks
    )
    summary = {
        "schema_version": 1,
        "carrier_size": len(carrier),
        "relations": len(relations),
        "predicates": len(predicates),
        "relation_pairs": len(relations) ** 2,
        "refinement_pairs": len(refinement_pairs),
        "validity_context_checks": validity_context_checks,
        "strongest_post_checks": strongest_post_checks,
        "weakest_pre_checks": weakest_pre_checks,
        "equivalence_context_checks": equivalence_context_checks,
        "strongest_post_extensionality_checks": strongest_post_extensionality_checks,
        "weakest_pre_extensionality_checks": weakest_pre_extensionality_checks,
        "separating_edge_checks": separating_edge_checks,
        "composition_refinement_checks": composition_refinement_checks,
        "total_checks": total_checks,
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
