(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_078.
Definition abs_78 (n : nat) : nat := n.
Definition repr_78 (n : nat) : nat := n.

Theorem retraction_78 : forall n : nat, abs_78 (repr_78 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_078.

