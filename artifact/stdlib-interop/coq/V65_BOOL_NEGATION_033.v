(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_033.
Require Import Coq.Bool.Bool.

Definition flip_33 (b : bool) : bool := negb b.

Theorem flip_involutive_33 : forall b : bool, flip_33 (flip_33 b) = b.
Proof.
  intro b.
  unfold flip_33.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_33 : forall b : bool, flip_33 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_033.

