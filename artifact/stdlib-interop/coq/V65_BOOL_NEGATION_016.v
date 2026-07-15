(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_016.
Require Import Coq.Bool.Bool.

Definition flip_16 (b : bool) : bool := negb b.

Theorem flip_involutive_16 : forall b : bool, flip_16 (flip_16 b) = b.
Proof.
  intro b.
  unfold flip_16.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_16 : forall b : bool, flip_16 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_016.

