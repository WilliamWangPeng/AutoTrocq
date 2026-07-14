# Artifact Guide

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

## Curated Paper Artifact

The `artifact/` directory is intentionally smaller than the historical local
workspace. It contains only the source and evidence needed to inspect the
reported workflow:

- `large-generated/`: 60 generated relation-witness modules and replay data;
- `case-studies/`: 12 hand-written Coq developments and replay data;
- `policy-stress/`: policy-accept and safe-reject cases;
- `relation-strength/`: relation-strength cases;
- `scaling/`: scaling-curve source and summaries;
- `../MANIFEST_SHA256.csv`: hashes of all tracked release files.

Generated `.vo`, `.glob`, `.vok`, and `.vos` files are excluded. Reviewers
recreate them locally with the replay scripts.

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
- The historical stress corpus is larger than the curated public subset and
  is intended for archival storage rather than the source repository.
