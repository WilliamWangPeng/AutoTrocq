(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_020.
Require Import Coq.Bool.Bool.

Definition flip_20 (b : bool) : bool := negb b.

Theorem flip_involutive_20 : forall b : bool, flip_20 (flip_20 b) = b.
Proof.
  intro b.
  unfold flip_20.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_20 : forall b : bool, flip_20 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_020.

