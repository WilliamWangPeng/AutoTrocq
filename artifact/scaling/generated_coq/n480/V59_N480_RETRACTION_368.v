(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_368.
Definition abs_368 (n : nat) : nat := n.
Definition repr_368 (n : nat) : nat := n.

Theorem retraction_368 : forall n : nat, abs_368 (repr_368 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_368.

