# Mechanized policy, outcome, and composition verification

- Date: 2026-07-21
- Coq: 8.20.1
- Sources: `AutoTrocqOutcomeSemantics.v`, `AutoTrocqComposition.v`
- `coqc -q AutoTrocqOutcomeSemantics.v`: exit status 0
- `coqchk -silent AutoTrocqOutcomeSemantics`: exit status 0
- `coqc -q AutoTrocqComposition.v`: exit status 0
- `coqchk -silent AutoTrocqComposition`: exit status 0

The source proves three policy-order lemmas, policy-block classification,
accepted-outcome soundness, classification exhaustiveness, constructor
disjointness, and the finite-list outcome-count partition.

The composition source proves 17 generic results: exact admission and
axiom-free laws for requirement union; associativity and identities for
relational composition; certificate preservation and relatedness; exact
composed-policy admission; axiom-free conservation; and associativity and
identity laws for certificate transfer, relation, and requirement fields. It
also checks two concrete facts for a `nat` to `option nat` to `list nat`
certificate chain.
