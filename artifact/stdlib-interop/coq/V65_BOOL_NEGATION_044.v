(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_044.
Require Import Coq.Bool.Bool.

Definition flip_44 (b : bool) : bool := negb b.

Theorem flip_involutive_44 : forall b : bool, flip_44 (flip_44 b) = b.
Proof.
  intro b.
  unfold flip_44.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_44 : forall b : bool, flip_44 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_044.

