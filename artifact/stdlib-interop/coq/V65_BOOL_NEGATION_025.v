(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_025.
Require Import Coq.Bool.Bool.

Definition flip_25 (b : bool) : bool := negb b.

Theorem flip_involutive_25 : forall b : bool, flip_25 (flip_25 b) = b.
Proof.
  intro b.
  unfold flip_25.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_25 : forall b : bool, flip_25 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_025.

