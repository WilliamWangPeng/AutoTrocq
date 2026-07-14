(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_028.
Definition abs_28 (n : nat) : nat := n.
Definition repr_28 (n : nat) : nat := n.

Theorem retraction_28 : forall n : nat, abs_28 (repr_28 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_028.

