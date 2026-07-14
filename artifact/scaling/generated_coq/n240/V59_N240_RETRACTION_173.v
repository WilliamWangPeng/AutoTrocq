(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_173.
Definition abs_173 (n : nat) : nat := n.
Definition repr_173 (n : nat) : nat := n.

Theorem retraction_173 : forall n : nat, abs_173 (repr_173 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_173.

