(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_388.
Definition abs_388 (n : nat) : nat := n.
Definition repr_388 (n : nat) : nat := n.

Theorem retraction_388 : forall n : nat, abs_388 (repr_388 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_388.

