(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_010.
Require Import Coq.Bool.Bool.

Definition flip_10 (b : bool) : bool := negb b.

Theorem flip_involutive_10 : forall b : bool, flip_10 (flip_10 b) = b.
Proof.
  intro b.
  unfold flip_10.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_10 : forall b : bool, flip_10 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_010.

