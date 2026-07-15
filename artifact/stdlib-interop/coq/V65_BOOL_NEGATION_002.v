(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_002.
Require Import Coq.Bool.Bool.

Definition flip_2 (b : bool) : bool := negb b.

Theorem flip_involutive_2 : forall b : bool, flip_2 (flip_2 b) = b.
Proof.
  intro b.
  unfold flip_2.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_2 : forall b : bool, flip_2 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_002.

