(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_383.
Definition abs_383 (n : nat) : nat := n.
Definition repr_383 (n : nat) : nat := n.

Theorem retraction_383 : forall n : nat, abs_383 (repr_383 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_383.

