(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_343.
Definition abs_343 (n : nat) : nat := n.
Definition repr_343 (n : nat) : nat := n.

Theorem retraction_343 : forall n : nat, abs_343 (repr_343 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_343.

