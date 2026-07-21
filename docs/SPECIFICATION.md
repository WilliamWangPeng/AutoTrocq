# Package Specification

AutoTrocq 0.2.1 accepts UTF-8 JSON objects. Coq fragments are copied into a
generated module and are therefore checked by Coq rather than interpreted by
the Python process.

## Required Fields

`module`
: A valid Coq identifier used for the generated file and module.

`source_type`, `target_type`
: Coq expressions denoting the two carrier types.

`relation`
: A Coq term expected to have type `Source -> Target -> Prop`.

`laws`
: An array of objects with `name`, `kind`, `statement`, and `proof` fields.
  Supported kinds are `logical`, `section`, and `retraction`.

`required_axioms`
: Names of axioms on which the package depends.

`policy.allowed_axioms`
: Names permitted by the active policy. Every required axiom must occur in
  this list for the package to be generated.

## Optional Fields

`requested_strength`
: One of `plain`, `logical`, `section`, `retraction`, or `equivalence`. If it
  is omitted, AutoTrocq infers the strongest directly evidenced form:
  section plus retraction gives equivalence; otherwise the corresponding
  single law determines the result; no law gives plain.

`imports`
: Coq library names emitted as `Require Import` commands.

`definitions`
: Supporting Coq declarations emitted before the laws.

## Strength Obligations

| Strength | Required law kinds |
| --- | --- |
| plain | none |
| logical | logical |
| section | section |
| retraction | retraction |
| equivalence | section and retraction |

An invalid or incomplete specification exits with status 2. A policy-blocked
specification also exits with status 2 but writes a manifest whose
`policy_outcome` is `safe_reject` and whose `blocked_axioms` field explains
the boundary.

## Batch Contract

`autotrocq batch SPEC_DIR --out BUILD_DIR` processes all top-level `*.json`
files in lexical order. Each specification receives a separate output
directory. The aggregate CSV uses mutually exclusive final outcomes:

| Outcome | Meaning |
| --- | --- |
| `accepted_kernel_checked` | policy accepted; both `coqc` and `coqchk` returned 0 |
| `safe_reject_policy_blocked` | one or more required axioms were not allowed |
| `unexpected_invalid_spec` | the JSON package did not satisfy this contract |
| `unexpected_kernel_failure` | an accepted generated package failed replay |

The batch command exits successfully when all rows are either checked
acceptances or policy-safe rejections. Either unexpected outcome makes it exit
with status 1.
