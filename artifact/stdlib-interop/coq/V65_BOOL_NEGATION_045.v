(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_045.
Require Import Coq.Bool.Bool.

Definition flip_45 (b : bool) : bool := negb b.

Theorem flip_involutive_45 : forall b : bool, flip_45 (flip_45 b) = b.
Proof.
  intro b.
  unfold flip_45.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_45 : forall b : bool, flip_45 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_045.

