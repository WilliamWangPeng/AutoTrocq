(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_022.
Require Import Coq.Bool.Bool.

Definition flip_22 (b : bool) : bool := negb b.

Theorem flip_involutive_22 : forall b : bool, flip_22 (flip_22 b) = b.
Proof.
  intro b.
  unfold flip_22.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_22 : forall b : bool, flip_22 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_022.

