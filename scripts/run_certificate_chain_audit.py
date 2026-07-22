from __future__ import annotations

import argparse
import csv
import itertools
import json
from dataclasses import dataclass
from pathlib import Path


Carrier = tuple[int, ...]
Relation = frozenset[tuple[int, int]]
Predicate = frozenset[int]
Function = tuple[int, ...]
Effect = frozenset[int]


@dataclass(frozen=True)
class Stage:
    function: Function
    relation: Relation
    pre: Predicate
    post: Predicate


def powerset(items: tuple[object, ...]) -> list[frozenset[object]]:
    return [
        frozenset(selection)
        for size in range(len(items) + 1)
        for selection in itertools.combinations(items, size)
    ]


def valid(relation: Relation, pre: Predicate, post: Predicate) -> bool:
    return all(a not in pre or b in post for a, b in relation)


def compose(carrier: Carrier, first: Relation, second: Relation) -> Relation:
    return frozenset(
        (a, c)
        for a in carrier
        for c in carrier
        if any((a, b) in first and (b, c) in second for b in carrier)
    )


def fold_relation(carrier: Carrier, chain: tuple[Stage, ...]) -> Relation:
    result = frozenset((x, x) for x in carrier)
    for stage in chain:
        result = compose(carrier, result, stage.relation)
    return result


def enumerate_path(carrier: Carrier, chain: tuple[Stage, ...]) -> Relation:
    if not chain:
        return frozenset((x, x) for x in carrier)
    result: set[tuple[int, int]] = set()
    for points in itertools.product(carrier, repeat=len(chain) + 1):
        if all(
            (points[index], points[index + 1]) in stage.relation
            for index, stage in enumerate(chain)
        ):
            result.add((points[0], points[-1]))
    return frozenset(result)


def fold_function(chain: tuple[Stage, ...], source: int) -> int:
    current = source
    for stage in chain:
        current = stage.function[current]
    return current


def compose_folded_functions(
    left: tuple[Stage, ...], right: tuple[Stage, ...], source: int
) -> int:
    return fold_function(right, fold_function(left, source))


def compose_functions(first: Function, second: Function) -> Function:
    return tuple(second[first[source]] for source in range(len(first)))


def generate_chains(
    stages_by_pre: dict[Predicate, list[Stage]],
    predicates: list[Predicate],
    maximum_length: int,
) -> list[tuple[Stage, ...]]:
    chains: list[tuple[Stage, ...]] = [tuple()]
    frontier: list[tuple[tuple[Stage, ...], Predicate]] = [
        (tuple(), predicate) for predicate in predicates
    ]
    for _ in range(maximum_length):
        next_frontier: list[tuple[tuple[Stage, ...], Predicate]] = []
        seen: set[tuple[Stage, ...]] = set()
        for prefix, current in frontier:
            for stage in stages_by_pre[current]:
                extended = prefix + (stage,)
                if extended not in seen:
                    chains.append(extended)
                    seen.add(extended)
                next_frontier.append((extended, stage.post))
        frontier = next_frontier
    return chains


def record(
    mismatches: list[dict[str, str]], law: str, observed: bool, expected: bool
) -> None:
    if observed != expected:
        mismatches.append(
            {"law": law, "observed": str(observed), "expected": str(expected)}
        )


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Exhaustively check finite certificate-chain laws."
    )
    parser.add_argument(
        "--out", type=Path, default=Path("artifact/certificate_chains")
    )
    args = parser.parse_args()

    carrier: Carrier = (0, 1)
    edges = tuple((a, b) for a in carrier for b in carrier)
    relations = [frozenset(r) for r in powerset(edges)]
    predicates = [frozenset(p) for p in powerset(tuple(carrier))]
    functions = list(itertools.product(carrier, repeat=len(carrier)))

    stages: list[Stage] = []
    for pre in predicates:
        for post in predicates:
            for function in functions:
                for relation in relations:
                    related = all((a, function[a]) in relation for a in carrier)
                    if related and valid(relation, pre, post):
                        stages.append(Stage(function, relation, pre, post))
    stages_by_pre = {
        predicate: [stage for stage in stages if stage.pre == predicate]
        for predicate in predicates
    }
    chains = generate_chains(stages_by_pre, predicates, maximum_length=3)
    mismatches: list[dict[str, str]] = []

    endpoint_relation_checks = 0
    folded_transfer_checks = 0
    selected_related_checks = 0
    selected_preservation_checks = 0
    endpoint_validity_checks = 0
    append_relation_checks = 0
    append_transfer_checks = 0
    category_associativity_checks = 0
    category_identity_checks = 0

    for chain in chains:
        folded_relation = fold_relation(carrier, chain)
        enumerated_relation = enumerate_path(carrier, chain)
        for edge in edges:
            endpoint_relation_checks += 1
            record(
                mismatches,
                "folded_endpoint_relation",
                edge in folded_relation,
                edge in enumerated_relation,
            )

        for source in carrier:
            endpoint = fold_function(chain, source)
            folded_transfer_checks += 1
            direct = source
            for stage in chain:
                direct = stage.function[direct]
            record(mismatches, "folded_transfer", endpoint, direct)

            selected_related_checks += 1
            record(
                mismatches,
                "selected_endpoint_related",
                (source, endpoint) in folded_relation,
                True,
            )

            selected_preservation_checks += 1
            if chain:
                observed_preservation = source not in chain[0].pre or endpoint in chain[-1].post
            else:
                observed_preservation = True
            record(
                mismatches,
                "selected_endpoint_preservation",
                observed_preservation,
                True,
            )

        if chain:
            endpoint_validity_checks += 1
            record(
                mismatches,
                "folded_relation_validity",
                valid(folded_relation, chain[0].pre, chain[-1].post),
                True,
            )

        for split in range(len(chain) + 1):
            left = chain[:split]
            right = chain[split:]
            composed_relation = compose(
                carrier, fold_relation(carrier, left), fold_relation(carrier, right)
            )
            for edge in edges:
                append_relation_checks += 1
                record(
                    mismatches,
                    "append_relation_coherence",
                    edge in folded_relation,
                    edge in composed_relation,
                )
            for source in carrier:
                append_transfer_checks += 1
                record(
                    mismatches,
                    "append_transfer_coherence",
                    fold_function(chain, source),
                    compose_folded_functions(left, right, source),
                )

        if len(chain) == 3:
            first, second, third = chain
            left_relation = compose(
                carrier,
                compose(carrier, first.relation, second.relation),
                third.relation,
            )
            right_relation = compose(
                carrier,
                first.relation,
                compose(carrier, second.relation, third.relation),
            )
            for edge in edges:
                category_associativity_checks += 1
                record(
                    mismatches,
                    "category_relation_associativity",
                    edge in left_relation,
                    edge in right_relation,
                )
            left_function = compose_functions(
                compose_functions(first.function, second.function), third.function
            )
            right_function = compose_functions(
                first.function, compose_functions(second.function, third.function)
            )
            for source in carrier:
                category_associativity_checks += 1
                record(
                    mismatches,
                    "category_transfer_associativity",
                    left_function[source],
                    right_function[source],
                )

    identity_relation = frozenset((source, source) for source in carrier)
    identity_function: Function = tuple(carrier)
    for stage in stages:
        for relation, law in (
            (compose(carrier, identity_relation, stage.relation), "category_relation_left_identity"),
            (compose(carrier, stage.relation, identity_relation), "category_relation_right_identity"),
        ):
            for edge in edges:
                category_identity_checks += 1
                record(
                    mismatches,
                    law,
                    edge in relation,
                    edge in stage.relation,
                )
        for function, law in (
            (compose_functions(identity_function, stage.function), "category_transfer_left_identity"),
            (compose_functions(stage.function, identity_function), "category_transfer_right_identity"),
        ):
            for source in carrier:
                category_identity_checks += 1
                record(
                    mismatches,
                    law,
                    function[source],
                    stage.function[source],
                )

    effect_atoms = (0, 1)
    effects = [frozenset(effect) for effect in powerset(effect_atoms)]
    effect_chains = [
        tuple(chain)
        for length in range(6)
        for chain in itertools.product(effects, repeat=length)
    ]
    required_union_checks = 0
    admission_checks = 0
    axiom_free_checks = 0
    append_required_checks = 0
    effect_associativity_checks = 0
    effect_identity_checks = 0

    for chain in effect_chains:
        folded_effect = frozenset().union(*chain) if chain else frozenset()
        for atom in effect_atoms:
            required_union_checks += 1
            record(
                mismatches,
                "folded_required_union",
                atom in folded_effect,
                any(atom in stage_effect for stage_effect in chain),
            )
        for allowed in effects:
            admission_checks += 1
            record(
                mismatches,
                "folded_admission_exact",
                folded_effect <= allowed,
                all(stage_effect <= allowed for stage_effect in chain),
            )
        axiom_free_checks += 1
        record(
            mismatches,
            "folded_axiom_free_exact",
            not folded_effect,
            all(not stage_effect for stage_effect in chain),
        )
        for split in range(len(chain) + 1):
            left_union = frozenset().union(*chain[:split]) if split else frozenset()
            right_union = (
                frozenset().union(*chain[split:]) if split < len(chain) else frozenset()
            )
            for atom in effect_atoms:
                append_required_checks += 1
                record(
                    mismatches,
                    "append_required_coherence",
                    atom in folded_effect,
                    atom in (left_union | right_union),
                )

    empty_effect: Effect = frozenset()
    for effect in effects:
        for composed, law in (
            (empty_effect | effect, "effect_left_identity"),
            (effect | empty_effect, "effect_right_identity"),
        ):
            for atom in effect_atoms:
                effect_identity_checks += 1
                record(mismatches, law, atom in composed, atom in effect)

    for first, second, third in itertools.product(effects, repeat=3):
        left_effect = (first | second) | third
        right_effect = first | (second | third)
        for atom in effect_atoms:
            effect_associativity_checks += 1
            record(
                mismatches,
                "effect_associativity",
                atom in left_effect,
                atom in right_effect,
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
        "folded_transfer_checks": folded_transfer_checks,
        "selected_related_checks": selected_related_checks,
        "selected_preservation_checks": selected_preservation_checks,
        "endpoint_validity_checks": endpoint_validity_checks,
        "append_relation_checks": append_relation_checks,
        "append_transfer_checks": append_transfer_checks,
        "category_associativity_checks": category_associativity_checks,
        "category_identity_checks": category_identity_checks,
        "required_union_checks": required_union_checks,
        "admission_checks": admission_checks,
        "axiom_free_checks": axiom_free_checks,
        "append_required_checks": append_required_checks,
        "effect_associativity_checks": effect_associativity_checks,
        "effect_identity_checks": effect_identity_checks,
    }
    summary = {
        "schema_version": 1,
        "carrier_size": len(carrier),
        "relations": len(relations),
        "predicates": len(predicates),
        "functions": len(functions),
        "valid_stages": len(stages),
        "maximum_certificate_chain_length": 3,
        "certificate_chains": len(chains),
        "effect_atoms": len(effect_atoms),
        "maximum_effect_chain_length": 5,
        "effect_chains": len(effect_chains),
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
