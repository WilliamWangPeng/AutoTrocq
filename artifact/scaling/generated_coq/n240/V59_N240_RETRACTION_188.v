(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_188.
Definition abs_188 (n : nat) : nat := n.
Definition repr_188 (n : nat) : nat := n.

Theorem retraction_188 : forall n : nat, abs_188 (repr_188 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_188.

