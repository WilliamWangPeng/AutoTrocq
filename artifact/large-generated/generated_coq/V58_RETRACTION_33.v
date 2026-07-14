(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_33.
Definition abs_33 (n : nat) : nat := n.
Definition repr_33 (n : nat) : nat := n.

Theorem retraction_33 : forall n : nat, abs_33 (repr_33 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_33.

