(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_013.
Require Import Coq.Bool.Bool.

Definition flip_13 (b : bool) : bool := negb b.

Theorem flip_involutive_13 : forall b : bool, flip_13 (flip_13 b) = b.
Proof.
  intro b.
  unfold flip_13.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_13 : forall b : bool, flip_13 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_013.

