(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_033.
Definition abs_33 (n : nat) : nat := n.
Definition repr_33 (n : nat) : nat := n.

Theorem retraction_33 : forall n : nat, abs_33 (repr_33 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_033.

