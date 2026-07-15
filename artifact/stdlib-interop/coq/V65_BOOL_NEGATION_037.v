(* V65 standard-library interoperability module *)
(* FAMILY: bool-negation *)
(* OBLIGATIONS: 2 *)

Module V65_BOOL_NEGATION_037.
Require Import Coq.Bool.Bool.

Definition flip_37 (b : bool) : bool := negb b.

Theorem flip_involutive_37 : forall b : bool, flip_37 (flip_37 b) = b.
Proof.
  intro b.
  unfold flip_37.
  now rewrite negb_involutive.
Qed.

Theorem flip_false_true_37 : forall b : bool, flip_37 b = false -> b = true.
Proof.
  destruct b; simpl; congruence.
Qed.
End V65_BOOL_NEGATION_037.

