(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_243.
Definition abs_243 (n : nat) : nat := n.
Definition repr_243 (n : nat) : nat := n.

Theorem retraction_243 : forall n : nat, abs_243 (repr_243 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_243.

