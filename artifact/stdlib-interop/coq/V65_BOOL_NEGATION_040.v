(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_040.
Require Import Coq.Bool.Bool.

Definition flip_40 (b : bool) : bool := negb b.

Theorem flip_involutive_40 : forall b : bool, flip_40 (flip_40 b) = b.
Proof.
  intro b.
  unfold flip_40.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_40 : forall b : bool, flip_40 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_040.

