(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_009.
Require Import Coq.Bool.Bool.

Definition flip_9 (b : bool) : bool := negb b.

Theorem flip_involutive_9 : forall b : bool, flip_9 (flip_9 b) = b.
Proof.
  intro b.
  unfold flip_9.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_9 : forall b : bool, flip_9 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_009.

