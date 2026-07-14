(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_203.
Definition abs_203 (n : nat) : nat := n.
Definition repr_203 (n : nat) : nat := n.

Theorem retraction_203 : forall n : nat, abs_203 (repr_203 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_203.

