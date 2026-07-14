(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_423.
Definition abs_423 (n : nat) : nat := n.
Definition repr_423 (n : nat) : nat := n.

Theorem retraction_423 : forall n : nat, abs_423 (repr_423 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_423.

