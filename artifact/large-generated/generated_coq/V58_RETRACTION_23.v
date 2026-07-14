(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_23.
Definition abs_23 (n : nat) : nat := n.
Definition repr_23 (n : nat) : nat := n.

Theorem retraction_23 : forall n : nat, abs_23 (repr_23 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_23.

