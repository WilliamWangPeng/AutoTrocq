# Mechanized policy, outcome, composition, and completeness verification

- Date: 2026-07-21
- Coq: 8.20.1
- Sources: `AutoTrocqOutcomeSemantics.v`, `AutoTrocqComposition.v`,
  `AutoTrocqPredicateTransformers.v`
- `coqc -q AutoTrocqOutcomeSemantics.v`: exit status 0
- `coqchk -silent AutoTrocqOutcomeSemantics`: exit status 0
- `coqc -q AutoTrocqComposition.v`: exit status 0
- `coqchk -silent AutoTrocqComposition`: exit status 0
- `coqc -q AutoTrocqPredicateTransformers.v`: exit status 0
- `coqchk -silent AutoTrocqPredicateTransformers`: exit status 0

The source proves three policy-order lemmas, policy-block classification,
accepted-outcome soundness, classification exhaustiveness, constructor
disjointness, and the finite-list outcome-count partition.

The composition source proves 18 generic results: exact admission and
axiom-free laws for requirement union; associativity and identities for
relational composition; certificate preservation and relatedness; exact
composed-policy admission; axiom-free conservation; and associativity and
identity laws for certificate transfer, relation, and requirement fields. It
also checks two concrete facts for a `nat` to `option nat` to `list nat`
certificate chain.

The predicate-transformer source proves 12 generic results: monotonicity,
exact weakest-precondition and strongest-postcondition composition, identity
laws, their Galois correspondence, two equivalent characterizations of
relation-valid transfer, and certificate completeness for both
characterizations. Three examples check selected-image preservation,
relatedness, and a counterexample showing that selected-image preservation
does not imply preservation for every target admitted by a nondeterministic
relation.
