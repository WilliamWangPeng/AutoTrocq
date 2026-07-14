(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_013.
Definition abs_13 (n : nat) : nat := n.
Definition repr_13 (n : nat) : nat := n.

Theorem retraction_13 : forall n : nat, abs_13 (repr_13 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_013.

