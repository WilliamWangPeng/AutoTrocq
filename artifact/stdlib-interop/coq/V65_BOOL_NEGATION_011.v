(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_011.
Require Import Coq.Bool.Bool.

Definition flip_11 (b : bool) : bool := negb b.

Theorem flip_involutive_11 : forall b : bool, flip_11 (flip_11 b) = b.
Proof.
  intro b.
  unfold flip_11.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_11 : forall b : bool, flip_11 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_011.

