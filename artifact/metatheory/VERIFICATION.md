# Mechanized policy, outcome, composition, and completeness verification

- Date: 2026-07-22
- Coq: 8.20.1
- Sources: `AutoTrocqOutcomeSemantics.v`, `AutoTrocqComposition.v`,
  `AutoTrocqPredicateTransformers.v`, `AutoTrocqIntermediateAssertions.v`, and
  `AutoTrocqFullAbstraction.v`, `AutoTrocqFiniteChains.v`, and
  `AutoTrocqCertificateChains.v`
- `coqc -q AutoTrocqOutcomeSemantics.v`: exit status 0
- `coqchk -silent AutoTrocqOutcomeSemantics`: exit status 0
- `coqc -q AutoTrocqComposition.v`: exit status 0
- `coqchk -silent AutoTrocqComposition`: exit status 0
- `coqc -q AutoTrocqPredicateTransformers.v`: exit status 0
- `coqchk -silent AutoTrocqPredicateTransformers`: exit status 0
- `coqc -q AutoTrocqIntermediateAssertions.v`: exit status 0
- `coqchk -silent AutoTrocqIntermediateAssertions`: exit status 0
- `coqc -q AutoTrocqFullAbstraction.v`: exit status 0
- `coqchk -silent AutoTrocqFullAbstraction`: exit status 0
- `coqc -q AutoTrocqFiniteChains.v`: exit status 0
- `coqchk -silent AutoTrocqFiniteChains`: exit status 0
- `coqc -q AutoTrocqCertificateChains.v`: exit status 0
- `coqchk -silent AutoTrocqCertificateChains`: exit status 0

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

The intermediate-assertion source proves 10 generic results: relation-validity
conservativity and transformer variance under refinement; the exact interval
characterization of valid intermediate predicates; equivalence between
composite validity and existence of a stagewise cut; canonical strongest and
weakest cuts; their universal bounds; and composition conservativity under
componentwise refinement. Two Boolean examples separate a deterministic chain
with a valid cut from an ambiguous chain with no valid cut.

The full-abstraction source proves 11 generic results: constructive recovery
of a relation from strongest postconditions or weakest preconditions; exact
equivalences among relation refinement, validity-theory inclusion, and both
transformer orders; extensional equivalence from validity and transformer
semantics; a constructive separating context for a missing edge; and
compositionality of relational and contextual refinement. Three Boolean
examples check strict refinement, failure of the converse, and the generated
separator.

The finite-chain source proves nine generic results: endpoint validity is
equivalent to existence of a complete stagewise cut sequence for every finite
heterogeneous relation path; recursive weakest preconditions and strongest
postconditions exactly characterize the endpoint relation; both transformer
orders characterize validity; and canonical backward and forward cut
sequences always exist. Two examples instantiate a path from `nat` through
`option nat` to `list nat`.

The certificate-chain source proves 24 generic results: folding a finite
heterogeneous certificate chain preserves its transfer, selected relatedness,
and endpoint relation-validity; folded requirements are exactly the stage
union; policy admission and axiom freedom hold exactly stagewise; append is
associative with identities; folding commutes with append for transfer,
relation, and requirement observations; certificate observational equivalence
is an equivalence relation and a composition congruence; certificate
composition satisfies associativity and both identity laws modulo this
equivalence; and folding preserves empty, singleton, and concatenated paths.
Three examples instantiate the `nat`--`option nat`--`list nat` chain.
