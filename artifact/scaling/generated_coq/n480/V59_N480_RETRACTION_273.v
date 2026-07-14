(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_273.
Definition abs_273 (n : nat) : nat := n.
Definition repr_273 (n : nat) : nat := n.

Theorem retraction_273 : forall n : nat, abs_273 (repr_273 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_273.

