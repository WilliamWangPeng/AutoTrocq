(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_358.
Definition abs_358 (n : nat) : nat := n.
Definition repr_358 (n : nat) : nat := n.

Theorem retraction_358 : forall n : nat, abs_358 (repr_358 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_358.

