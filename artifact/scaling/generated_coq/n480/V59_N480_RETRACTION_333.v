(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_333.
Definition abs_333 (n : nat) : nat := n.
Definition repr_333 (n : nat) : nat := n.

Theorem retraction_333 : forall n : nat, abs_333 (repr_333 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_333.

