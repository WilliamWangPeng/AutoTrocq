(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_463.
Definition abs_463 (n : nat) : nat := n.
Definition repr_463 (n : nat) : nat := n.

Theorem retraction_463 : forall n : nat, abs_463 (repr_463 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_463.

