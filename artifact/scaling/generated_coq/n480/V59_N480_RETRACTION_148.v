(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_148.
Definition abs_148 (n : nat) : nat := n.
Definition repr_148 (n : nat) : nat := n.

Theorem retraction_148 : forall n : nat, abs_148 (repr_148 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_148.

