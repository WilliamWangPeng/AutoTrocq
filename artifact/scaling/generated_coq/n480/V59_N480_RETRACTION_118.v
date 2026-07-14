(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_118.
Definition abs_118 (n : nat) : nat := n.
Definition repr_118 (n : nat) : nat := n.

Theorem retraction_118 : forall n : nat, abs_118 (repr_118 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_118.

