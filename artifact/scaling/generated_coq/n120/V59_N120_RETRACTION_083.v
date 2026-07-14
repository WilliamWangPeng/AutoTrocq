(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: retraction *)

Module V59_N120_RETRACTION_083.
Definition abs_83 (n : nat) : nat := n.
Definition repr_83 (n : nat) : nat := n.

Theorem retraction_83 : forall n : nat, abs_83 (repr_83 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N120_RETRACTION_083.

