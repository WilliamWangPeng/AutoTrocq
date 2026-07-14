(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_38.
Definition abs_38 (n : nat) : nat := n.
Definition repr_38 (n : nat) : nat := n.

Theorem retraction_38 : forall n : nat, abs_38 (repr_38 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_38.

