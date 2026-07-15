(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_043.
Require Import Coq.Bool.Bool.

Definition flip_43 (b : bool) : bool := negb b.

Theorem flip_involutive_43 : forall b : bool, flip_43 (flip_43 b) = b.
Proof.
  intro b.
  unfold flip_43.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_43 : forall b : bool, flip_43 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_043.

