(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_021.
Require Import Coq.Bool.Bool.

Definition flip_21 (b : bool) : bool := negb b.

Theorem flip_involutive_21 : forall b : bool, flip_21 (flip_21 b) = b.
Proof.
  intro b.
  unfold flip_21.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_21 : forall b : bool, flip_21 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_021.

