(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_034.
Require Import Coq.Bool.Bool.

Definition flip_34 (b : bool) : bool := negb b.

Theorem flip_involutive_34 : forall b : bool, flip_34 (flip_34 b) = b.
Proof.
  intro b.
  unfold flip_34.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_34 : forall b : bool, flip_34 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_034.

