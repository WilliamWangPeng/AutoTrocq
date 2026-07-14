(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_163.
Definition abs_163 (n : nat) : nat := n.
Definition repr_163 (n : nat) : nat := n.

Theorem retraction_163 : forall n : nat, abs_163 (repr_163 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_163.

