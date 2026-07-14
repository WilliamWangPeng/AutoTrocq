(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_323.
Definition abs_323 (n : nat) : nat := n.
Definition repr_323 (n : nat) : nat := n.

Theorem retraction_323 : forall n : nat, abs_323 (repr_323 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_323.

