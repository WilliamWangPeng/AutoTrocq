(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_143.
Definition abs_143 (n : nat) : nat := n.
Definition repr_143 (n : nat) : nat := n.

Theorem retraction_143 : forall n : nat, abs_143 (repr_143 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_143.

