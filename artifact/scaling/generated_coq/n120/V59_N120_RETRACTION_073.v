(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: retraction *)

Module V59_N120_RETRACTION_073.
Definition abs_73 (n : nat) : nat := n.
Definition repr_73 (n : nat) : nat := n.

Theorem retraction_73 : forall n : nat, abs_73 (repr_73 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N120_RETRACTION_073.

