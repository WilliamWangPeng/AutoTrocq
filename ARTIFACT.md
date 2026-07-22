# Artifact Guide

Persistent software archive (all versions): https://doi.org/10.5281/zenodo.21378177

## Evaluation Boundary

AutoTrocq separates four outcomes that should not be collapsed:

1. specification validation;
2. axiom-policy acceptance or safe rejection;
3. Coq compilation with `coqc`;
4. independent object checking with `coqchk`.

Only a candidate that reaches stages 3 and 4 is reported as
`kernel_success`. A disallowed axiom is retained as `safe_reject`.

## Minimal Reproduction

Run `scripts/reproduce_quickstart.ps1` on Windows or
`scripts/reproduce_quickstart.sh` on Linux/macOS. Expected results:

- one generated section package;
- policy outcome `accept`;
- `coqc` exit status 0;
- `coqchk` exit status 0;
- replay outcome `kernel_success`;
- all Python unit tests pass.

The quickstart normally completes in under one minute once Python and Coq are
installed. Runtime varies with filesystem and process-startup cost.

## Complete Paper Artifact

The `artifact/` directory contains the source and evidence needed to inspect
the reported workflow without carrying compiled Coq objects:

- `large-generated/`: 60 generated relation-witness modules and replay data;
- `case-studies/`: 12 hand-written Coq developments and replay data;
- `policy-stress/`: policy-accept and safe-reject cases;
- `relation-strength/`: relation-strength cases;
- `scaling/`: scaling-curve source and summaries;
- `minimal-replay/`, `seed-suite/`, and `generated-seed/`: initial witnesses;
- `library-migration/`, `stdlib-interop/`, `proof-maintenance/`, and
  `third-party-idiom/`: larger controlled workload families;
- `robustness-matrix/`: accepted, policy-blocked, and compile-blocked requests;
- `strict-outcome-audit/`: the mutually exclusive 3,221-request ledger and
  per-suite summary;
- `direct-cli-matrix/`: 15 executable package specifications and direct batch
  results;
- `full-release-validation/`: outcome-aware Coq 8.20.1 full-run CSV and JSON
  summaries for all 3,220 sources and 15 `coqchk` batches;
- `metatheory/`: Coq proofs of policy monotonicity, classification soundness,
  disjointness, exhaustiveness, the finite outcome-count partition, and
  compositional proof-transfer certificates, including weakest-precondition
  and strongest-postcondition characterizations and complete intermediate
  assertion bounds, contextual full abstraction, constructive separators,
  compositional contextual refinement, complete cut semantics for finite
  heterogeneous relation paths, and coherent finite certificate-chain folds;
- `composition_policy/`: exhaustive 32,768-case implementation/theorem
  conformance summary and mismatch ledger;
- `predicate_transformers/`: exhaustive 2,304-case finite audit of exact
  predicate-transformer composition and the Galois correspondence;
- `intermediate_assertions/`: exhaustive 125,456-case audit of cut existence,
  exact intermediate intervals, and relation-refinement conservativity;
- `full_abstraction/`: exhaustive 19,105-check audit of contextual refinement,
  transformer order and extensionality, separating contexts, and composition;
- `finite_chains/`: exhaustive 297,092-check audit of finite-path relations,
  iterated predicate transformers, cut completeness, and canonical cuts;
- `certificate_chains/`: exhaustive 2,883,379-check audit of certificate
  folding, endpoint preservation, append coherence, exact policy admission,
  and axiom-freedom conservation;
- `../MANIFEST_SHA256.csv`: hashes of all tracked release files.

The complete corpus contains 3,220 `.v` files. Its strict ledger contains
3,221 decision requests because one relation-strength diagnostic is rejected
before a Coq source file is generated. The outcomes are mutually exclusive:
3,036 accepted and independently checked requests, 65 policy-safe rejections,
120 compile-safe rejections, and zero unexpected failures.

Generated `.vo`, `.glob`, `.vok`, and `.vos` files are excluded. Reviewers
recreate them locally with the replay scripts.

The outcome metatheory contains eight completed results. The composition
metatheory contains 18 generic results plus two concrete examples, and the
predicate-transformer metatheory contains 12 generic results plus three
examples. The intermediate-assertion metatheory adds 10 generic results and two
examples. The full-abstraction metatheory adds 11 generic results and three
examples. The finite-chain metatheory adds nine generic results and two
heterogeneous examples. The certificate-chain metatheory adds 20 generic
results and three examples, for 88 generic results and 15 examples overall.
From `artifact/metatheory/`, compile and check all seven modules:

```text
coqc -q AutoTrocqOutcomeSemantics.v
coqchk -silent AutoTrocqOutcomeSemantics
coqc -q AutoTrocqComposition.v
coqchk -silent AutoTrocqComposition
coqc -q AutoTrocqPredicateTransformers.v
coqchk -silent AutoTrocqPredicateTransformers
coqc -q AutoTrocqIntermediateAssertions.v
coqchk -silent AutoTrocqIntermediateAssertions
coqc -q AutoTrocqFullAbstraction.v
coqchk -silent AutoTrocqFullAbstraction
coqc -q AutoTrocqFiniteChains.v
coqchk -silent AutoTrocqFiniteChains
coqc -q AutoTrocqCertificateChains.v
coqchk -silent AutoTrocqCertificateChains
```

## Trust Statement

AutoTrocq is not part of the trusted computing base. JSON parsing, strength
inference, policy classification, and Coq text generation are ordinary
programs and may contain bugs. The reported proof evidence is the generated
source accepted by `coqc` and the resulting object accepted by `coqchk`.
Manifest hashes support file identity; they do not establish semantic
correctness.

## Known Limitations

- The public prototype consumes declarative package specifications; it does
  not parse arbitrary CIC environments.
- It checks supplied relation laws but does not synthesize their proofs.
- Timing results are machine-dependent and should not be read as portable
  performance guarantees.
- The corpus is controlled rather than mined from arbitrary third-party Coq
  repositories; its timings are therefore workload measurements, not a claim
  about all proof developments.
