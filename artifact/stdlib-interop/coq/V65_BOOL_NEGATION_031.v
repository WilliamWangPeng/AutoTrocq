(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_031.
Require Import Coq.Bool.Bool.

Definition flip_31 (b : bool) : bool := negb b.

Theorem flip_involutive_31 : forall b : bool, flip_31 (flip_31 b) = b.
Proof.
  intro b.
  unfold flip_31.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_31 : forall b : bool, flip_31 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_031.

