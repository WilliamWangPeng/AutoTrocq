(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_001.
Require Import Coq.Bool.Bool.

Definition flip_1 (b : bool) : bool := negb b.

Theorem flip_involutive_1 : forall b : bool, flip_1 (flip_1 b) = b.
Proof.
  intro b.
  unfold flip_1.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_1 : forall b : bool, flip_1 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_001.

