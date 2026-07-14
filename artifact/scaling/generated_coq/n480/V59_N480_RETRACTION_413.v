(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_413.
Definition abs_413 (n : nat) : nat := n.
Definition repr_413 (n : nat) : nat := n.

Theorem retraction_413 : forall n : nat, abs_413 (repr_413 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_413.

