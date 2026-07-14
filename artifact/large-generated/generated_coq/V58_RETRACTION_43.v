(* V58 generated module *)
(* CATEGORY: retraction *)

Module V58_RETRACTION_43.
Definition abs_43 (n : nat) : nat := n.
Definition repr_43 (n : nat) : nat := n.

Theorem retraction_43 : forall n : nat, abs_43 (repr_43 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V58_RETRACTION_43.

