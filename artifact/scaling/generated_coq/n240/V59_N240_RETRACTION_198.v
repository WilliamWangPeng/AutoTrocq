(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_198.
Definition abs_198 (n : nat) : nat := n.
Definition repr_198 (n : nat) : nat := n.

Theorem retraction_198 : forall n : nat, abs_198 (repr_198 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_198.

