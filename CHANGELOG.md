# Changelog

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
