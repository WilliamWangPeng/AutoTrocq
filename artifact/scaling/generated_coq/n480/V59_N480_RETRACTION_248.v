(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_248.
Definition abs_248 (n : nat) : nat := n.
Definition repr_248 (n : nat) : nat := n.

Theorem retraction_248 : forall n : nat, abs_248 (repr_248 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_248.

