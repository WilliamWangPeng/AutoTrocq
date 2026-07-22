# Changelog

## 0.9.0 - 2026-07-22

- Prove associativity and both identity laws for certificate composition up
  to observational equivalence.
- Prove that folding a singleton certificate path recovers its certificate,
  complementing the empty-path and concatenation laws.
- Establish the category laws for predicate-indexed certificates modulo
  observational equivalence and the corresponding free-path fold laws.
- Add four generic Coq results and extend the exhaustive certificate-chain
  audit to 3,357,787 checks with zero mismatches.

## 0.8.0 - 2026-07-22

- Define type-indexed finite heterogeneous chains of complete proof-transfer
  certificates and a total fold into one endpoint certificate.
- Prove preservation of the folded transfer, endpoint relatedness, and
  relation-validity for arbitrary chain length.
- Prove that folded axiom requirements are exactly the stage union, yielding
  exact all-stage policy admission and axiom-freedom conservation/reflection.
- Prove associative chain append and coherence of folding with append for
  transfer functions, endpoint relations, and requirements.
- Define certificate observational equivalence, prove that it is an
  equivalence relation and a congruence for composition, and show that folding
  preserves chain identities and concatenation up to this equivalence.
- Add 20 generic Coq results, three heterogeneous examples, and a
  2,883,379-check exhaustive audit with zero mismatches.

## 0.7.0 - 2026-07-22

- Lift stagewise cut completeness from two relations to arbitrary finite
  heterogeneous relation paths whose intermediate carriers are type indexed.
- Prove exact whole-path weakest-precondition and strongest-postcondition
  semantics and both validity characterizations.
- Construct canonical backward weakest-precondition cuts and forward
  strongest-postcondition cuts for every finite path.
- Add nine generic Coq results, two heterogeneous examples, and a 297,092-check
  exhaustive finite audit with zero mismatches.

## 0.6.0 - 2026-07-22

- Prove contextual full abstraction: relation refinement is equivalent to
  preservation of every valid predicate-transfer judgment.
- Give exact strongest-postcondition and weakest-precondition orders for
  refinement and reconstruct the original relation from either transformer.
- Construct a separating predicate context for every non-refining edge and
  prove contextual refinement is preserved by relational composition.
- Add 11 generic Coq results, three examples, and a 19,105-check exhaustive
  audit with zero mismatches.

## 0.5.0 - 2026-07-22

- Prove that a composite transfer is valid exactly when an intermediate
  assertion exists that validates both stages.
- Characterize every valid intermediate assertion by the exact interval from
  the strongest postcondition of the first stage to the weakest precondition
  of the second stage.
- Establish canonical strongest and weakest intermediate assertions and
  conservativity under componentwise relation refinement.
- Add 10 generic Coq results, two separating examples, and a 125,456-case
  finite audit with zero mismatches.

## 0.4.1 - 2026-07-22

- Make the predicate-transformer audit honor its `--out` directory so CI and
  reviewers can run it without writing into the source checkout.
- Compile Coq CI sources in a writable temporary directory while preserving
  independent `coqchk` verification.

## 0.4.0 - 2026-07-22

- Strengthen certificate preservation from the selected function image to
  every target admitted by the certificate relation.
- Add weakest-precondition and strongest-postcondition semantics for transfer
  relations, with exact composition, identity, monotonicity, and Galois laws.
- Mechanize 38 generic results and five concrete examples across three Coq
  modules and verify every module independently with `coqchk`.
- Exhaustively validate 2,304 finite predicate-transformer identities with
  zero mismatches, including a counterexample to image-only preservation.

## 0.3.0 - 2026-07-22

- Add a compositional proof-transfer certificate calculus mechanized in Coq.
- Prove preservation, relation witnessing, exact composed-policy admission,
  axiom-free conservation, associativity, and identity laws.
- Add `autotrocq compose-policy` for exact requirement-union decisions.
- Exhaustively validate 32,768 two-stage policy configurations over five
  axiom names with zero implementation/theorem mismatches.
- Add two concrete kernel-checked certificate-composition examples.

## 0.2.1 - 2026-07-21

- Add a Coq mechanization of axiom-policy monotonicity and the four-way
  outcome semantics.
- Prove accepted-outcome soundness, outcome disjointness and exhaustiveness,
  and the finite-ledger counting identity.
- Record successful Coq 8.20.1 compilation and independent `coqchk`
  verification for the metatheory module.
- Preserve the 3,221-request empirical ledger and full replay results.

## 0.2.0 - 2026-07-15

- Add outcome-aware `autotrocq batch` generation and kernel replay.
- Add a direct 15-case CLI matrix over five relation strengths and three axiom
  policies.
- Publish the complete 3,220-module, 3,221-request experimental corpus.
- Correct the empirical ledger to 3,036 checked acceptances, 65 policy-safe
  rejections, 120 compile-safe rejections, and zero unexpected failures.
- Make full-corpus replay validate expected positive and negative outcomes
  without writing compiled objects into the archived source tree.

## 0.1.2 - 2026-07-15

- Add complete Zenodo release metadata and enable persistent software archiving.
- Preserve the validated command semantics and 922-module replay corpus.

## 0.1.1 - 2026-07-14

- Publish a clean release tag after validating the Linux CI workflow.
- Retain the same relation-package semantics and 922-module replay corpus.
- Refresh package, citation, and reproducibility metadata.

## 0.1.0 - 2026-07-14

- First releasable research prototype.
- Added declarative relation-package specifications.
- Added finite relation-strength validation and inference.
- Added explicit axiom-policy acceptance and safe rejection.
- Added deterministic Coq source and manifest generation.
- Added `coqc` and `coqchk` replay with JSON evidence.
- Added quickstart examples, tests, citation metadata, and artifact guide.
