(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_328.
Definition abs_328 (n : nat) : nat := n.
Definition repr_328 (n : nat) : nat := n.

Theorem retraction_328 : forall n : nat, abs_328 (repr_328 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_328.

