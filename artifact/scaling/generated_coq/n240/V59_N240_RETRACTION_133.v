(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_133.
Definition abs_133 (n : nat) : nat := n.
Definition repr_133 (n : nat) : nat := n.

Theorem retraction_133 : forall n : nat, abs_133 (repr_133 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_133.

