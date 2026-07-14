(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_48.
Definition abs_48 (n : nat) : nat := n.
Definition repr_48 (n : nat) : nat := n.

Theorem retraction_48 : forall n : nat, abs_48 (repr_48 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_48.

