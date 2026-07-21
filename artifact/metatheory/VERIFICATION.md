# Mechanized outcome-semantics verification

- Date: 2026-07-21
- Coq: 8.20.1
- Source: `AutoTrocqOutcomeSemantics.v`
- `coqc -q AutoTrocqOutcomeSemantics.v`: exit status 0
- `coqchk -silent AutoTrocqOutcomeSemantics`: exit status 0

The source proves three policy-order lemmas, policy-block classification,
accepted-outcome soundness, classification exhaustiveness, constructor
disjointness, and the finite-list outcome-count partition.
