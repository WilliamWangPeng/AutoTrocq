(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_035.
Require Import Coq.Bool.Bool.

Definition flip_35 (b : bool) : bool := negb b.

Theorem flip_involutive_35 : forall b : bool, flip_35 (flip_35 b) = b.
Proof.
  intro b.
  unfold flip_35.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_35 : forall b : bool, flip_35 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_035.

