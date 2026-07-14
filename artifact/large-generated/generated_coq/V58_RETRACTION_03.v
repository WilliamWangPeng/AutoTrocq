(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_03.
Definition abs_3 (n : nat) : nat := n.
Definition repr_3 (n : nat) : nat := n.

Theorem retraction_3 : forall n : nat, abs_3 (repr_3 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_03.

