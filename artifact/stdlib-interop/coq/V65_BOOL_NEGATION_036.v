(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_036.
Require Import Coq.Bool.Bool.

Definition flip_36 (b : bool) : bool := negb b.

Theorem flip_involutive_36 : forall b : bool, flip_36 (flip_36 b) = b.
Proof.
  intro b.
  unfold flip_36.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_36 : forall b : bool, flip_36 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_036.

