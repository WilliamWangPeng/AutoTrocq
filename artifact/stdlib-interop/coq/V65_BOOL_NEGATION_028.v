(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_028.
Require Import Coq.Bool.Bool.

Definition flip_28 (b : bool) : bool := negb b.

Theorem flip_involutive_28 : forall b : bool, flip_28 (flip_28 b) = b.
Proof.
  intro b.
  unfold flip_28.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_28 : forall b : bool, flip_28 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_028.

