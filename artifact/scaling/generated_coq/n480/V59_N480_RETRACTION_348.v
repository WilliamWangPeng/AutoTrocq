(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_348.
Definition abs_348 (n : nat) : nat := n.
Definition repr_348 (n : nat) : nat := n.

Theorem retraction_348 : forall n : nat, abs_348 (repr_348 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_348.

