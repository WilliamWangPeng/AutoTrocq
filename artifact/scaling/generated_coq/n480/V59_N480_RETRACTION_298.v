(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_298.
Definition abs_298 (n : nat) : nat := n.
Definition repr_298 (n : nat) : nat := n.

Theorem retraction_298 : forall n : nat, abs_298 (repr_298 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_298.

