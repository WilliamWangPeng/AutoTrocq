(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_029.
Require Import Coq.Bool.Bool.

Definition flip_29 (b : bool) : bool := negb b.

Theorem flip_involutive_29 : forall b : bool, flip_29 (flip_29 b) = b.
Proof.
  intro b.
  unfold flip_29.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_29 : forall b : bool, flip_29 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_029.

