# Package Specification

AutoTrocq 0.10.0 accepts UTF-8 JSON objects. Coq fragments are copied into a
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

## Composition Policy Contract

`autotrocq compose-policy SPEC... --allowed-axiom NAME...` validates every
stage specification and computes the deduplicated union of all
`required_axioms` fields. The chain is accepted exactly when that union is a
subset of the command-line allow list. The JSON result records stage modules,
the requirement union, the allow list, blocked axioms, and `policy_outcome`.

This command accounts for declared requirements. It does not infer the
transitive axiom footprint of the embedded Coq terms. The corresponding
composition and exact-admission theorems are mechanized in
`artifact/metatheory/AutoTrocqComposition.v`.

The relational certificate contract quantifies preservation over every target
admitted by the declared relation, rather than only over the selected function
image. `AutoTrocqPredicateTransformers.v` characterizes this obligation by
weakest preconditions and strongest postconditions, proves their exact
composition and Galois laws, and records an image-only counterexample. These
results concern explicit relations and predicates; they do not synthesize a
relation from arbitrary CIC terms.

`AutoTrocqIntermediateAssertions.v` proves a cut-completeness result for two
explicit transfer stages. A composite is relation-valid exactly when some
intermediate predicate validates both stages. Every such predicate lies
between the strongest postcondition of the first stage and the weakest
precondition of the second, and both endpoints are canonical valid choices.
The same module proves that narrowing either relation conservatively preserves
composite validity.

`AutoTrocqFullAbstraction.v` proves that relation refinement is equivalent to
preservation of every predicate-transfer judgment and to the corresponding
orders on strongest postconditions and weakest preconditions. It reconstructs
the relation from either transformer, constructs a separating predicate
context for every non-refining edge, and proves that contextual refinement is
preserved by relational composition. These results are constructive and do
not assume finite carriers or decidable equality.

`AutoTrocqFiniteChains.v` lifts the two-stage cut result to arbitrary finite
heterogeneous paths. Its indexed path type records every intermediate carrier,
so ill-typed compositions cannot be represented. Endpoint validity is
equivalent to existence of a complete sequence of stage-valid predicates, and
iterated weakest preconditions and strongest postconditions give canonical
backward and forward cut sequences. The theorem is constructive and imposes no
finiteness or decidability assumption on the carriers.

`AutoTrocqCertificateChains.v` lifts composition from relations to complete
proof-transfer certificates. An indexed chain records every intermediate
predicate and carrier, and its fold preserves the endpoint transfer function,
relation witness, and property proof. The folded requirement is exactly the
union of the stage requirements; therefore a policy admits the fold exactly
when it admits every stage, and the fold is axiom-free exactly when every stage
is axiom-free. Chain append is associative and folding commutes with append for
the transfer, relation, and requirement observations. These three fields define
a certificate observational equivalence; the development proves that it is an
equivalence relation, composition is congruent, and folding preserves chain
identity and append up to that equivalence.
