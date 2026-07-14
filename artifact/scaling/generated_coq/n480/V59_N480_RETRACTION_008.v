(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_008.
Definition abs_8 (n : nat) : nat := n.
Definition repr_8 (n : nat) : nat := n.

Theorem retraction_8 : forall n : nat, abs_8 (repr_8 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_008.

