(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_138.
Definition abs_138 (n : nat) : nat := n.
Definition repr_138 (n : nat) : nat := n.

Theorem retraction_138 : forall n : nat, abs_138 (repr_138 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_138.

