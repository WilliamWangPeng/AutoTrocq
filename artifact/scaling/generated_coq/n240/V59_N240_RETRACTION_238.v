(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_238.
Definition abs_238 (n : nat) : nat := n.
Definition repr_238 (n : nat) : nat := n.

Theorem retraction_238 : forall n : nat, abs_238 (repr_238 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_238.

