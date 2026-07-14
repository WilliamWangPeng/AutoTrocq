(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_268.
Definition abs_268 (n : nat) : nat := n.
Definition repr_268 (n : nat) : nat := n.

Theorem retraction_268 : forall n : nat, abs_268 (repr_268 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_268.

