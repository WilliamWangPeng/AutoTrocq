(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_003.
Definition abs_3 (n : nat) : nat := n.
Definition repr_3 (n : nat) : nat := n.

Theorem retraction_3 : forall n : nat, abs_3 (repr_3 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_003.

