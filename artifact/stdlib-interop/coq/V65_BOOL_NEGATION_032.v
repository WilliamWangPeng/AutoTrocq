(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_032.
Require Import Coq.Bool.Bool.

Definition flip_32 (b : bool) : bool := negb b.

Theorem flip_involutive_32 : forall b : bool, flip_32 (flip_32 b) = b.
Proof.
  intro b.
  unfold flip_32.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_32 : forall b : bool, flip_32 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_032.

