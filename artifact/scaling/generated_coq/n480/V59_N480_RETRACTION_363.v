(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_363.
Definition abs_363 (n : nat) : nat := n.
Definition repr_363 (n : nat) : nat := n.

Theorem retraction_363 : forall n : nat, abs_363 (repr_363 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_363.

