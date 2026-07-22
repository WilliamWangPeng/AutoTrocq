from __future__ import annotations

import argparse
import csv
import itertools
import json
from pathlib import Path


Carrier = tuple[int, ...]
Relation = frozenset[tuple[int, int]]
Predicate = frozenset[int]
Chain = tuple[Relation, ...]


def powerset(items: tuple[object, ...]) -> list[frozenset[object]]:
    return [
        frozenset(selection)
        for size in range(len(items) + 1)
        for selection in itertools.combinations(items, size)
    ]


def valid(relation: Relation, pre: Predicate, post: Predicate) -> bool:
    return all(a not in pre or b in post for a, b in relation)


def weakest_pre(carrier: Carrier, relation: Relation, post: Predicate) -> Predicate:
    return frozenset(
        a
        for a in carrier
        if all(b in post for x, b in relation if x == a)
    )


def strongest_post(relation: Relation, pre: Predicate) -> Predicate:
    return frozenset(b for a, b in relation if a in pre)


def compose(carrier: Carrier, first: Relation, second: Relation) -> Relation:
    return frozenset(
        (a, c)
        for a in carrier
        for c in carrier
        if any((a, b) in first and (b, c) in second for b in carrier)
    )


def recursive_path_relation(carrier: Carrier, chain: Chain) -> Relation:
    relation = frozenset((x, x) for x in carrier)
    for edge_relation in reversed(chain):
        relation = compose(carrier, edge_relation, relation)
    return relation


def enumerated_path_relation(carrier: Carrier, chain: Chain) -> Relation:
    if not chain:
        return frozenset((x, x) for x in carrier)
    result: set[tuple[int, int]] = set()
    for endpoints in itertools.product(carrier, repeat=len(chain) + 1):
        if all((endpoints[i], endpoints[i + 1]) in relation
               for i, relation in enumerate(chain)):
            result.add((endpoints[0], endpoints[-1]))
    return frozenset(result)


def recursive_wp(carrier: Carrier, chain: Chain, post: Predicate) -> Predicate:
    current = post
    for relation in reversed(chain):
        current = weakest_pre(carrier, relation, current)
    return current


def recursive_sp(chain: Chain, pre: Predicate) -> Predicate:
    current = pre
    for relation in chain:
        current = strongest_post(relation, current)
    return current


def cut_chain_exists(
    chain: Chain,
    predicates: list[Predicate],
    pre: Predicate,
    post: Predicate,
) -> bool:
    reachable = {pre}
    for relation in chain:
        reachable = {
            candidate
            for current in reachable
            for candidate in predicates
            if valid(relation, current, candidate)
        }
    return any(current <= post for current in reachable)


def backward_cuts_valid(
    carrier: Carrier, chain: Chain, post: Predicate
) -> bool:
    cuts = [frozenset() for _ in range(len(chain) + 1)]
    cuts[-1] = post
    for index in range(len(chain) - 1, -1, -1):
        cuts[index] = weakest_pre(carrier, chain[index], cuts[index + 1])
    return all(
        valid(relation, cuts[index], cuts[index + 1])
        for index, relation in enumerate(chain)
    ) and cuts[-1] <= post


def forward_cuts_valid(chain: Chain, pre: Predicate) -> bool:
    cuts = [pre]
    for relation in chain:
        cuts.append(strongest_post(relation, cuts[-1]))
    return all(
        valid(relation, cuts[index], cuts[index + 1])
        for index, relation in enumerate(chain)
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
        description="Exhaustively check finite relation-path laws."
    )
    parser.add_argument("--out", type=Path, default=Path("artifact/finite_chains"))
    args = parser.parse_args()

    carrier: Carrier = (0, 1)
    edges = tuple((a, b) for a in carrier for b in carrier)
    relations = [frozenset(r) for r in powerset(edges)]
    predicates = [frozenset(p) for p in powerset(tuple(carrier))]
    chains = [
        tuple(chain)
        for length in range(4)
        for chain in itertools.product(relations, repeat=length)
    ]
    mismatches: list[dict[str, str]] = []

    endpoint_relation_checks = 0
    weakest_pre_checks = 0
    strongest_post_checks = 0
    validity_wp_checks = 0
    validity_sp_checks = 0
    validity_cut_checks = 0
    backward_cut_checks = 0
    forward_cut_checks = 0

    for chain in chains:
        recursive_relation = recursive_path_relation(carrier, chain)
        enumerated_relation = enumerated_path_relation(carrier, chain)
        for edge in edges:
            endpoint_relation_checks += 1
            record(
                mismatches,
                "endpoint_relation",
                edge in recursive_relation,
                edge in enumerated_relation,
            )

        for post in predicates:
            weakest_pre_checks += 1
            record(
                mismatches,
                "path_weakest_pre",
                recursive_wp(carrier, chain, post)
                == weakest_pre(carrier, enumerated_relation, post),
                True,
            )
            backward_cut_checks += 1
            record(
                mismatches,
                "canonical_backward_cuts",
                backward_cuts_valid(carrier, chain, post),
                True,
            )

        for pre in predicates:
            strongest_post_checks += 1
            record(
                mismatches,
                "path_strongest_post",
                recursive_sp(chain, pre) == strongest_post(enumerated_relation, pre),
                True,
            )
            forward_cut_checks += 1
            record(
                mismatches,
                "canonical_forward_cuts",
                forward_cuts_valid(chain, pre),
                True,
            )

            for post in predicates:
                endpoint_valid = valid(enumerated_relation, pre, post)
                validity_wp_checks += 1
                record(
                    mismatches,
                    "validity_weakest_pre",
                    pre <= recursive_wp(carrier, chain, post),
                    endpoint_valid,
                )
                validity_sp_checks += 1
                record(
                    mismatches,
                    "validity_strongest_post",
                    recursive_sp(chain, pre) <= post,
                    endpoint_valid,
                )
                validity_cut_checks += 1
                record(
                    mismatches,
                    "validity_cut_chain",
                    cut_chain_exists(chain, predicates, pre, post),
                    endpoint_valid,
                )

    args.out.mkdir(parents=True, exist_ok=True)
    fields = ["law", "observed", "expected"]
    with (args.out / "mismatches.csv").open(
        "w", encoding="utf-8", newline=""
    ) as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(mismatches)

    check_counts = {
        "endpoint_relation_checks": endpoint_relation_checks,
        "weakest_pre_checks": weakest_pre_checks,
        "strongest_post_checks": strongest_post_checks,
        "validity_wp_checks": validity_wp_checks,
        "validity_sp_checks": validity_sp_checks,
        "validity_cut_checks": validity_cut_checks,
        "backward_cut_checks": backward_cut_checks,
        "forward_cut_checks": forward_cut_checks,
    }
    summary = {
        "schema_version": 1,
        "carrier_size": len(carrier),
        "relations": len(relations),
        "predicates": len(predicates),
        "maximum_chain_length": 3,
        "chains": len(chains),
        **check_counts,
        "total_checks": sum(check_counts.values()),
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
