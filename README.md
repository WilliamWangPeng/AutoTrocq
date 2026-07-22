# AutoTrocq

[![CI](https://github.com/WilliamWangPeng/AutoTrocq/actions/workflows/ci.yml/badge.svg)](https://github.com/WilliamWangPeng/AutoTrocq/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/WilliamWangPeng/AutoTrocq)](https://github.com/WilliamWangPeng/AutoTrocq/releases/latest)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21378177.svg)](https://doi.org/10.5281/zenodo.21378177)

AutoTrocq is a research prototype for generating axiom-aware Coq relation
packages and recording kernel-facing replay evidence. A JSON specification
declares source and target types, a transfer relation, relation laws, and an
axiom policy. AutoTrocq checks the finite relation-strength requirements,
classifies policy violations as explicit safe rejections, emits a Coq module
and manifest, and can run both `coqc` and `coqchk` on an accepted package.

This repository accompanies the manuscript *Compositional Proof-Transfer
Certificates with Exact Axiom Accounting*.

Public repository: <https://github.com/WilliamWangPeng/AutoTrocq>

## Status and Scope

Version 0.6.0 is the current research-prototype release. It implements
the evaluated evidence path for declarative relation packages:

- finite relation strengths: plain, section, retraction, equivalence, and
  logical;
- explicit axiom effects and allow-list policies;
- policy-visible safe rejection;
- deterministic Coq package and SHA-256 manifest generation;
- `coqc` compilation followed by independent `coqchk` checking;
- machine-readable generation and replay reports.
- outcome-aware batch generation and replay with mutually exclusive accepted,
  policy-blocked, compile-blocked, and unexpected-failure classifications.
- a Coq mechanization of policy monotonicity and the finite outcome partition.
- a Coq certificate calculus with proof-preserving relational composition,
  exact axiom-union admission, conservation, associativity, and identities;
- an executable `compose-policy` command and an exhaustive 32,768-case
  conformance audit over a five-axiom universe.
- relational weakest-precondition and strongest-postcondition semantics, exact
  composition laws, and a Galois correspondence mechanized in Coq;
- a 2,304-case finite predicate-transformer audit and a checked counterexample
  showing why preservation of only the selected image is insufficient.
- a complete intermediate-assertion theorem: a composite transfer is valid
  exactly when a stagewise cut exists, with all cuts characterized by the
  interval between the strongest postcondition and weakest precondition;
- componentwise relation-refinement conservativity and a 125,456-case finite
  audit of cut existence, interval bounds, and refinement.
- contextual full abstraction connecting relation refinement, inclusion of all
  valid predicate-transfer judgments, and exact `sp`/`wp` transformer orders;
- constructive separating contexts, compositional contextual refinement, and
  a 19,105-check exhaustive finite audit with zero mismatches.

The prototype does not parse arbitrary CIC terms or synthesize missing Coq
proofs. Relation definitions and law proofs are supplied in the package
specification and are checked by Coq. This boundary is deliberate: generated
text is a proposal, while successful kernel replay is evidence.

## Requirements

- Python 3.10 or later
- Coq 8.20.1, with `coqc` and `coqchk` on `PATH`

The reported artifact was validated with Python 3.14.3 and Coq 8.20.1 on
Windows 11. The command-line implementation uses only the Python standard
library.

## Quick Start

```powershell
python -m pip install -e .
autotrocq doctor
autotrocq generate examples/bool_nat_section.json --out build/quickstart
autotrocq replay build/quickstart/BoolNatSection.v `
  --report build/quickstart/BoolNatSection.replay.json
```

Run the complete quickstart and unit tests on Windows:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/reproduce_quickstart.ps1
```

On Linux or macOS:

```bash
bash scripts/reproduce_quickstart.sh
```

A successful run prints `kernel_success` and creates:

- `build/quickstart/BoolNatSection.v`
- `build/quickstart/BoolNatSection.manifest.json`
- `build/quickstart/BoolNatSection.replay.json`

## Policy-visible Rejection

The second example requests an axiom that its policy does not allow:

```powershell
autotrocq generate examples/blocked_axiom.json --out build/blocked
```

The command exits with status 2, writes a diagnostic manifest, and does not
emit a Coq candidate. This is a safe rejection rather than a failed or hidden
success.

## Composed Policy Decisions

Apply one policy to the exact union of a certificate chain's requirements:

```powershell
autotrocq compose-policy examples/bool_nat_section.json `
  examples/blocked_axiom.json `
  --allowed-axiom propositional_extensionality
```

The command validates every stage, deduplicates the requirement union, and
reports either `accept` or `safe_reject`. Re-run the exhaustive implementation
audit with:

```powershell
python scripts/run_composition_policy_audit.py
python scripts/run_predicate_transformer_audit.py
python scripts/run_intermediate_assertion_audit.py
python scripts/run_full_abstraction_audit.py
```

## Batch Evaluation

The `batch` command applies the same boundary to every JSON specification in a
directory and writes `batch_results.csv` plus `batch_summary.json`:

```powershell
autotrocq batch artifact/direct-cli-matrix/specs --out build/direct-matrix
```

The archived matrix contains 15 specifications: five relation strengths under
constructive, explicitly allowed-axiom, and blocked-axiom policies. Ten
accepted packages must pass both `coqc` and `coqchk`; five requests must be
classified as policy-safe rejections. An invalid specification or failed
kernel replay is an unexpected failure and makes the batch command fail.

## Specification Format

Each JSON specification contains:

- `module`: generated Coq module name;
- `source_type` and `target_type`: Coq type expressions;
- `relation`: a Coq term of type `Source -> Target -> Prop`;
- `definitions`: supporting Coq declarations;
- `laws`: named statements, proofs, and relation-strength kinds;
- `required_axioms`: the package effect summary;
- `policy.allowed_axioms`: the active allow list;
- `requested_strength`: optional required relation strength.

See [docs/SPECIFICATION.md](docs/SPECIFICATION.md) for the complete contract.

## Reproducing the Paper Evidence

The small quickstart validates the complete generate-policy-compile-check
path. The `artifact/` directory preserves all 3,220 evaluated Coq source
modules, the strict 3,221-request outcome ledger, raw result tables, the direct
CLI matrix, and replay entry points used by the paper. See
[ARTIFACT.md](ARTIFACT.md) for claim-to-file mapping and expected results.

Check all five mechanized developments independently:

```powershell
cd artifact/metatheory
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
```

Replay the 82-module quick profile with outcome-aware expectations:

```powershell
python scripts/replay_artifact.py --profile quick
```

Replay all 3,220 source modules across 13 suites. The full profile requires
3,036 accepted modules to compile and pass `coqchk`, requires 120 negative
modules to fail compilation as designed, and retains 65 policy-safe rejection
requests (64 source-backed and one diagnostic-only request):

```powershell
python scripts/replay_artifact.py --profile full
```

The replay copies sources into `build/` before invoking Coq, so the archived
source tree remains free of compiled objects. It is serial by default because
sustained parallel Coq process creation is unreliable on some Windows
installations. Use `--jobs N` only after validating the local runtime.

The release also preserves the successful Coq 8.20.1 full-run outputs in
`artifact/full-release-validation/`: 3,036 accepted-source rows, 120 expected
compile-block rows, 15 successful `coqchk` batches, and the aggregate JSON
summary. Per-module build logs and compiled objects are intentionally excluded.

## Development

```powershell
python -m unittest discover -s tests -v
```

Release files are licensed under the MIT License. Generated Coq packages may
be used under the same license unless their input specification states a
different license.

## Citation

Citation metadata is provided in [CITATION.cff](CITATION.cff). The archived
software release is permanently available as
[doi:10.5281/zenodo.21378177](https://doi.org/10.5281/zenodo.21378177). This
concept DOI resolves to the latest archived release; Zenodo assigns a separate
immutable DOI to each version.
