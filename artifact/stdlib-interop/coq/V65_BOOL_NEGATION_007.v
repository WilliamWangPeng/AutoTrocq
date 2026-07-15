(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_007.
Require Import Coq.Bool.Bool.

Definition flip_7 (b : bool) : bool := negb b.

Theorem flip_involutive_7 : forall b : bool, flip_7 (flip_7 b) = b.
Proof.
  intro b.
  unfold flip_7.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_7 : forall b : bool, flip_7 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_007.

