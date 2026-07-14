(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_098.
Definition abs_98 (n : nat) : nat := n.
Definition repr_98 (n : nat) : nat := n.

Theorem retraction_98 : forall n : nat, abs_98 (repr_98 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_098.

