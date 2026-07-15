(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_049.
Require Import Coq.Bool.Bool.

Definition flip_49 (b : bool) : bool := negb b.

Theorem flip_involutive_49 : forall b : bool, flip_49 (flip_49 b) = b.
Proof.
  intro b.
  unfold flip_49.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_49 : forall b : bool, flip_49 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_049.

