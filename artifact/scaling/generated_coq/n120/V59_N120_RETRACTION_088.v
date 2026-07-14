(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: retraction *)

Module V59_N120_RETRACTION_088.
Definition abs_88 (n : nat) : nat := n.
Definition repr_88 (n : nat) : nat := n.

Theorem retraction_88 : forall n : nat, abs_88 (repr_88 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N120_RETRACTION_088.

