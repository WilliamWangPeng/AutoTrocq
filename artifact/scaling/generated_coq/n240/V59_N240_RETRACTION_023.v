(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_023.
Definition abs_23 (n : nat) : nat := n.
Definition repr_23 (n : nat) : nat := n.

Theorem retraction_23 : forall n : nat, abs_23 (repr_23 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_023.

