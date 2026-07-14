(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_408.
Definition abs_408 (n : nat) : nat := n.
Definition repr_408 (n : nat) : nat := n.

Theorem retraction_408 : forall n : nat, abs_408 (repr_408 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_408.

