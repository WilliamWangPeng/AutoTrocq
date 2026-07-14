(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_438.
Definition abs_438 (n : nat) : nat := n.
Definition repr_438 (n : nat) : nat := n.

Theorem retraction_438 : forall n : nat, abs_438 (repr_438 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_438.

