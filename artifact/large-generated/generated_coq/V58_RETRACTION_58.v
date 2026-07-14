(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_58.
Definition abs_58 (n : nat) : nat := n.
Definition repr_58 (n : nat) : nat := n.

Theorem retraction_58 : forall n : nat, abs_58 (repr_58 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_58.

