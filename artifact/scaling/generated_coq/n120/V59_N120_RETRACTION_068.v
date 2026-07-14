(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: retraction *)

Module V59_N120_RETRACTION_068.
Definition abs_68 (n : nat) : nat := n.
Definition repr_68 (n : nat) : nat := n.

Theorem retraction_68 : forall n : nat, abs_68 (repr_68 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N120_RETRACTION_068.

