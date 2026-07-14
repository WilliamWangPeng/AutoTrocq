(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_123.
Definition abs_123 (n : nat) : nat := n.
Definition repr_123 (n : nat) : nat := n.

Theorem retraction_123 : forall n : nat, abs_123 (repr_123 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_123.

