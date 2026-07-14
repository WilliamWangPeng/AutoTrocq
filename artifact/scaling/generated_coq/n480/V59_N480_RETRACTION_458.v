(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_458.
Definition abs_458 (n : nat) : nat := n.
Definition repr_458 (n : nat) : nat := n.

Theorem retraction_458 : forall n : nat, abs_458 (repr_458 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_458.

