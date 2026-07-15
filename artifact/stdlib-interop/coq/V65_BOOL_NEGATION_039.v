(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_039.
Require Import Coq.Bool.Bool.

Definition flip_39 (b : bool) : bool := negb b.

Theorem flip_involutive_39 : forall b : bool, flip_39 (flip_39 b) = b.
Proof.
  intro b.
  unfold flip_39.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_39 : forall b : bool, flip_39 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_039.

