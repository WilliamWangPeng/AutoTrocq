(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_046.
Require Import Coq.Bool.Bool.

Definition flip_46 (b : bool) : bool := negb b.

Theorem flip_involutive_46 : forall b : bool, flip_46 (flip_46 b) = b.
Proof.
  intro b.
  unfold flip_46.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_46 : forall b : bool, flip_46 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_046.

