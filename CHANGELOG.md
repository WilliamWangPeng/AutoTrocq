# Changelog

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
