(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_004.
Require Import Coq.Bool.Bool.

Definition flip_4 (b : bool) : bool := negb b.

Theorem flip_involutive_4 : forall b : bool, flip_4 (flip_4 b) = b.
Proof.
  intro b.
  unfold flip_4.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_4 : forall b : bool, flip_4 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_004.

