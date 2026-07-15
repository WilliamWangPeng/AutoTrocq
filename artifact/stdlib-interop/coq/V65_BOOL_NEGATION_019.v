(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_019.
Require Import Coq.Bool.Bool.

Definition flip_19 (b : bool) : bool := negb b.

Theorem flip_involutive_19 : forall b : bool, flip_19 (flip_19 b) = b.
Proof.
  intro b.
  unfold flip_19.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_19 : forall b : bool, flip_19 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_019.

