(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_042.
Require Import Coq.Bool.Bool.

Definition flip_42 (b : bool) : bool := negb b.

Theorem flip_involutive_42 : forall b : bool, flip_42 (flip_42 b) = b.
Proof.
  intro b.
  unfold flip_42.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_42 : forall b : bool, flip_42 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_042.

