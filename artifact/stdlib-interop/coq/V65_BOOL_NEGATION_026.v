(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_026.
Require Import Coq.Bool.Bool.

Definition flip_26 (b : bool) : bool := negb b.

Theorem flip_involutive_26 : forall b : bool, flip_26 (flip_26 b) = b.
Proof.
  intro b.
  unfold flip_26.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_26 : forall b : bool, flip_26 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_026.

