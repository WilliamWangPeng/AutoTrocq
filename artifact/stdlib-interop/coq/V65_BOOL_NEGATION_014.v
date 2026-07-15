(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_014.
Require Import Coq.Bool.Bool.

Definition flip_14 (b : bool) : bool := negb b.

Theorem flip_involutive_14 : forall b : bool, flip_14 (flip_14 b) = b.
Proof.
  intro b.
  unfold flip_14.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_14 : forall b : bool, flip_14 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_014.

