(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: retraction *)

Module V59_N120_RETRACTION_103.
Definition abs_103 (n : nat) : nat := n.
Definition repr_103 (n : nat) : nat := n.

Theorem retraction_103 : forall n : nat, abs_103 (repr_103 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N120_RETRACTION_103.

