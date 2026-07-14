(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_53.
Definition abs_53 (n : nat) : nat := n.
Definition repr_53 (n : nat) : nat := n.

Theorem retraction_53 : forall n : nat, abs_53 (repr_53 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_53.

