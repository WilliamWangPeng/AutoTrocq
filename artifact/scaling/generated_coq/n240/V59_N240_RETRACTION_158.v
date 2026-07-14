(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_158.
Definition abs_158 (n : nat) : nat := n.
Definition repr_158 (n : nat) : nat := n.

Theorem retraction_158 : forall n : nat, abs_158 (repr_158 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_158.

