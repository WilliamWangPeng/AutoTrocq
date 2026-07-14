# AutoTrocq

[![CI](https://github.com/WilliamWangPeng/AutoTrocq/actions/workflows/ci.yml/badge.svg)](https://github.com/WilliamWangPeng/AutoTrocq/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/WilliamWangPeng/AutoTrocq)](https://github.com/WilliamWangPeng/AutoTrocq/releases/latest)

AutoTrocq is a research prototype for generating axiom-aware Coq relation
packages and recording kernel-facing replay evidence. A JSON specification
declares source and target types, a transfer relation, relation laws, and an
axiom policy. AutoTrocq checks the finite relation-strength requirements,
classifies policy violations as explicit safe rejections, emits a Coq module
and manifest, and can run both `coqc` and `coqchk` on an accepted package.

This repository accompanies the manuscript *AutoTrocq: Axiom-Aware Proof
Transfer for CIC with Reproducible Coq Kernel Replay*.

Public repository: <https://github.com/WilliamWangPeng/AutoTrocq>

## Status and Scope

Version 0.1.1 is the current public research-prototype release. It implements
the evaluated evidence path for declarative relation packages:

- finite relation strengths: plain, section, retraction, equivalence, and
  logical;
- explicit axiom effects and allow-list policies;
- policy-visible safe rejection;
- deterministic Coq package and SHA-256 manifest generation;
- `coqc` compilation followed by independent `coqchk` checking;
- machine-readable generation and replay reports.

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
path. The curated artifact subset in `artifact/` preserves the evaluated Coq
sources, raw result tables, summaries, and replay entry points used by the
paper. See [ARTIFACT.md](ARTIFACT.md) for claim-to-file mapping and expected
results.

Replay the 82-module curated profile:

```powershell
python scripts/replay_artifact.py --profile quick
```

Replay the full 922-module public corpus, including the 840-module scaling
suite:

```powershell
python scripts/replay_artifact.py --profile full
```

The replay is serial by default because sustained parallel Coq process creation
is unreliable on some Windows installations. Use `--jobs N` only after
validating the local runtime.

## Development

```powershell
python -m unittest discover -s tests -v
```

Release files are licensed under the MIT License. Generated Coq packages may
be used under the same license unless their input specification states a
different license.

## Citation

Citation metadata is provided in [CITATION.cff](CITATION.cff). A persistent
archive DOI will be added to the metadata after the public repository release
is deposited in Zenodo.
