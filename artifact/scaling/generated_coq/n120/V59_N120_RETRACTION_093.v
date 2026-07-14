(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: retraction *)

Module V59_N120_RETRACTION_093.
Definition abs_93 (n : nat) : nat := n.
Definition repr_93 (n : nat) : nat := n.

Theorem retraction_93 : forall n : nat, abs_93 (repr_93 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N120_RETRACTION_093.

