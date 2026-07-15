(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_005.
Require Import Coq.Bool.Bool.

Definition flip_5 (b : bool) : bool := negb b.

Theorem flip_involutive_5 : forall b : bool, flip_5 (flip_5 b) = b.
Proof.
  intro b.
  unfold flip_5.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_5 : forall b : bool, flip_5 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_005.

