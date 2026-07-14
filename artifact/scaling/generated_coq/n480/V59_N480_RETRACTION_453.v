(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_453.
Definition abs_453 (n : nat) : nat := n.
Definition repr_453 (n : nat) : nat := n.

Theorem retraction_453 : forall n : nat, abs_453 (repr_453 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_453.

