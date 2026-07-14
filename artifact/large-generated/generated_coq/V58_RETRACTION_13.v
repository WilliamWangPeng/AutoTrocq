(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_13.
Definition abs_13 (n : nat) : nat := n.
Definition repr_13 (n : nat) : nat := n.

Theorem retraction_13 : forall n : nat, abs_13 (repr_13 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_13.

