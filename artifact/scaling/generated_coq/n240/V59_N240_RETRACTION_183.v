(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_183.
Definition abs_183 (n : nat) : nat := n.
Definition repr_183 (n : nat) : nat := n.

Theorem retraction_183 : forall n : nat, abs_183 (repr_183 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_183.

