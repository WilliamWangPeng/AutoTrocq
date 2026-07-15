(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_023.
Require Import Coq.Bool.Bool.

Definition flip_23 (b : bool) : bool := negb b.

Theorem flip_involutive_23 : forall b : bool, flip_23 (flip_23 b) = b.
Proof.
  intro b.
  unfold flip_23.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_23 : forall b : bool, flip_23 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_023.

