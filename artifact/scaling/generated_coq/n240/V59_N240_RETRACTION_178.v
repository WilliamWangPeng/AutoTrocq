(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_178.
Definition abs_178 (n : nat) : nat := n.
Definition repr_178 (n : nat) : nat := n.

Theorem retraction_178 : forall n : nat, abs_178 (repr_178 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_178.

