(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_024.
Require Import Coq.Bool.Bool.

Definition flip_24 (b : bool) : bool := negb b.

Theorem flip_involutive_24 : forall b : bool, flip_24 (flip_24 b) = b.
Proof.
  intro b.
  unfold flip_24.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_24 : forall b : bool, flip_24 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_024.

