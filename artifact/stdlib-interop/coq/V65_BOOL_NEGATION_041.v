(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_041.
Require Import Coq.Bool.Bool.

Definition flip_41 (b : bool) : bool := negb b.

Theorem flip_involutive_41 : forall b : bool, flip_41 (flip_41 b) = b.
Proof.
  intro b.
  unfold flip_41.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_41 : forall b : bool, flip_41 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_041.

