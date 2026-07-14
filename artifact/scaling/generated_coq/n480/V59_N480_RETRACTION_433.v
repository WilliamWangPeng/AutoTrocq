(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_433.
Definition abs_433 (n : nat) : nat := n.
Definition repr_433 (n : nat) : nat := n.

Theorem retraction_433 : forall n : nat, abs_433 (repr_433 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_433.

