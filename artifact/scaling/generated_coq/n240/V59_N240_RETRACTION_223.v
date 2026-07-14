(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_223.
Definition abs_223 (n : nat) : nat := n.
Definition repr_223 (n : nat) : nat := n.

Theorem retraction_223 : forall n : nat, abs_223 (repr_223 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_223.

