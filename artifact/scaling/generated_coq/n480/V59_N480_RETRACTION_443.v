(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_443.
Definition abs_443 (n : nat) : nat := n.
Definition repr_443 (n : nat) : nat := n.

Theorem retraction_443 : forall n : nat, abs_443 (repr_443 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_443.

