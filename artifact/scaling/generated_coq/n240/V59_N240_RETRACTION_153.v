(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_153.
Definition abs_153 (n : nat) : nat := n.
Definition repr_153 (n : nat) : nat := n.

Theorem retraction_153 : forall n : nat, abs_153 (repr_153 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_153.

