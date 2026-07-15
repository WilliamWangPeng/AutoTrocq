(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_018.
Require Import Coq.Bool.Bool.

Definition flip_18 (b : bool) : bool := negb b.

Theorem flip_involutive_18 : forall b : bool, flip_18 (flip_18 b) = b.
Proof.
  intro b.
  unfold flip_18.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_18 : forall b : bool, flip_18 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_018.

