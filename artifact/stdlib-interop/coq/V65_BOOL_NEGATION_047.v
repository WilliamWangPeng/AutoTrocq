(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_047.
Require Import Coq.Bool.Bool.

Definition flip_47 (b : bool) : bool := negb b.

Theorem flip_involutive_47 : forall b : bool, flip_47 (flip_47 b) = b.
Proof.
  intro b.
  unfold flip_47.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_47 : forall b : bool, flip_47 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_047.

