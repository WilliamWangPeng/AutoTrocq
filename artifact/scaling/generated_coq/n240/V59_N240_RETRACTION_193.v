(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_193.
Definition abs_193 (n : nat) : nat := n.
Definition repr_193 (n : nat) : nat := n.

Theorem retraction_193 : forall n : nat, abs_193 (repr_193 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_193.

