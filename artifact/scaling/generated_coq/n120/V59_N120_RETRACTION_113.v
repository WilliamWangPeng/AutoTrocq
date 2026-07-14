(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: retraction *)

Module V59_N120_RETRACTION_113.
Definition abs_113 (n : nat) : nat := n.
Definition repr_113 (n : nat) : nat := n.

Theorem retraction_113 : forall n : nat, abs_113 (repr_113 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N120_RETRACTION_113.

