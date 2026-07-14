(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_213.
Definition abs_213 (n : nat) : nat := n.
Definition repr_213 (n : nat) : nat := n.

Theorem retraction_213 : forall n : nat, abs_213 (repr_213 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_213.

