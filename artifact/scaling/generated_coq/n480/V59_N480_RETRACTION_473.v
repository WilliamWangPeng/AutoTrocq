(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_473.
Definition abs_473 (n : nat) : nat := n.
Definition repr_473 (n : nat) : nat := n.

Theorem retraction_473 : forall n : nat, abs_473 (repr_473 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_473.

