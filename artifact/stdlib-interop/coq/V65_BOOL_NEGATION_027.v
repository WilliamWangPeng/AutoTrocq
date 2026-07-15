(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_027.
Require Import Coq.Bool.Bool.

Definition flip_27 (b : bool) : bool := negb b.

Theorem flip_involutive_27 : forall b : bool, flip_27 (flip_27 b) = b.
Proof.
  intro b.
  unfold flip_27.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_27 : forall b : bool, flip_27 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_027.

