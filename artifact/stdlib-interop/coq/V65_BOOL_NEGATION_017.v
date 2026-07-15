(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_017.
Require Import Coq.Bool.Bool.

Definition flip_17 (b : bool) : bool := negb b.

Theorem flip_involutive_17 : forall b : bool, flip_17 (flip_17 b) = b.
Proof.
  intro b.
  unfold flip_17.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_17 : forall b : bool, flip_17 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_017.

