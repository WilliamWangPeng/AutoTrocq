(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_038.
Definition abs_38 (n : nat) : nat := n.
Definition repr_38 (n : nat) : nat := n.

Theorem retraction_38 : forall n : nat, abs_38 (repr_38 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_038.

