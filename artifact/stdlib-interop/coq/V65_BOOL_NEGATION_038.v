(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_038.
Require Import Coq.Bool.Bool.

Definition flip_38 (b : bool) : bool := negb b.

Theorem flip_involutive_38 : forall b : bool, flip_38 (flip_38 b) = b.
Proof.
  intro b.
  unfold flip_38.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_38 : forall b : bool, flip_38 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_038.

