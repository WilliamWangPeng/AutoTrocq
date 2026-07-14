(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_058.
Definition abs_58 (n : nat) : nat := n.
Definition repr_58 (n : nat) : nat := n.

Theorem retraction_58 : forall n : nat, abs_58 (repr_58 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_058.

