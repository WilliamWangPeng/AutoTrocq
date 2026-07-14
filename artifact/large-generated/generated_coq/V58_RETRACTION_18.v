(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_18.
Definition abs_18 (n : nat) : nat := n.
Definition repr_18 (n : nat) : nat := n.

Theorem retraction_18 : forall n : nat, abs_18 (repr_18 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_18.

