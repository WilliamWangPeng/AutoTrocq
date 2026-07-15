(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_008.
Require Import Coq.Bool.Bool.

Definition flip_8 (b : bool) : bool := negb b.

Theorem flip_involutive_8 : forall b : bool, flip_8 (flip_8 b) = b.
Proof.
  intro b.
  unfold flip_8.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_8 : forall b : bool, flip_8 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_008.

