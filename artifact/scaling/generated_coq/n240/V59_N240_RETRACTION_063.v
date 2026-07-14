(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_063.
Definition abs_63 (n : nat) : nat := n.
Definition repr_63 (n : nat) : nat := n.

Theorem retraction_63 : forall n : nat, abs_63 (repr_63 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_063.

