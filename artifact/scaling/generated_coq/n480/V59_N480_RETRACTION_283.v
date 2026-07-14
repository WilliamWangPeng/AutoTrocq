(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_283.
Definition abs_283 (n : nat) : nat := n.
Definition repr_283 (n : nat) : nat := n.

Theorem retraction_283 : forall n : nat, abs_283 (repr_283 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_283.

