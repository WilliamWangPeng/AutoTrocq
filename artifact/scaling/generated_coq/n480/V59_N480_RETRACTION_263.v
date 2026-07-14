(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_263.
Definition abs_263 (n : nat) : nat := n.
Definition repr_263 (n : nat) : nat := n.

Theorem retraction_263 : forall n : nat, abs_263 (repr_263 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_263.

