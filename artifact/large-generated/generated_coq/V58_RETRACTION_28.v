(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_28.
Definition abs_28 (n : nat) : nat := n.
Definition repr_28 (n : nat) : nat := n.

Theorem retraction_28 : forall n : nat, abs_28 (repr_28 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_28.

