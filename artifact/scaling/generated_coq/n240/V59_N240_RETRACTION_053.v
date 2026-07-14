(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: retraction *)

Module V59_N240_RETRACTION_053.
Definition abs_53 (n : nat) : nat := n.
Definition repr_53 (n : nat) : nat := n.

Theorem retraction_53 : forall n : nat, abs_53 (repr_53 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N240_RETRACTION_053.

