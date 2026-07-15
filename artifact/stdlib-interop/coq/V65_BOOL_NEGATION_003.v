(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_003.
Require Import Coq.Bool.Bool.

Definition flip_3 (b : bool) : bool := negb b.

Theorem flip_involutive_3 : forall b : bool, flip_3 (flip_3 b) = b.
Proof.
  intro b.
  unfold flip_3.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_3 : forall b : bool, flip_3 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_003.

