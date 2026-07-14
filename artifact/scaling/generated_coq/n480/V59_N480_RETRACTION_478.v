(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_478.
Definition abs_478 (n : nat) : nat := n.
Definition repr_478 (n : nat) : nat := n.

Theorem retraction_478 : forall n : nat, abs_478 (repr_478 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_478.

