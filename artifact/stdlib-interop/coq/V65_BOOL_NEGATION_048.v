(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_048.
Require Import Coq.Bool.Bool.

Definition flip_48 (b : bool) : bool := negb b.

Theorem flip_involutive_48 : forall b : bool, flip_48 (flip_48 b) = b.
Proof.
  intro b.
  unfold flip_48.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_48 : forall b : bool, flip_48 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_048.

