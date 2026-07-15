(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_006.
Require Import Coq.Bool.Bool.

Definition flip_6 (b : bool) : bool := negb b.

Theorem flip_involutive_6 : forall b : bool, flip_6 (flip_6 b) = b.
Proof.
  intro b.
  unfold flip_6.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_6 : forall b : bool, flip_6 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_006.

