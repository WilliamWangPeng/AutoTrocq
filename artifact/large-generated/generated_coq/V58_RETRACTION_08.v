(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_08.
Definition abs_8 (n : nat) : nat := n.
Definition repr_8 (n : nat) : nat := n.

Theorem retraction_8 : forall n : nat, abs_8 (repr_8 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_08.

