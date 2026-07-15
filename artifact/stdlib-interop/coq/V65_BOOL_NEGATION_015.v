(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_015.
Require Import Coq.Bool.Bool.

Definition flip_15 (b : bool) : bool := negb b.

Theorem flip_involutive_15 : forall b : bool, flip_15 (flip_15 b) = b.
Proof.
  intro b.
  unfold flip_15.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_15 : forall b : bool, flip_15 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_015.

