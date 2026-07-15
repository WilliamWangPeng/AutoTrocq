(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_030.
Require Import Coq.Bool.Bool.

Definition flip_30 (b : bool) : bool := negb b.

Theorem flip_involutive_30 : forall b : bool, flip_30 (flip_30 b) = b.
Proof.
  intro b.
  unfold flip_30.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_30 : forall b : bool, flip_30 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_030.

