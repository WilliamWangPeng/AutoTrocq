(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_288.
Definition abs_288 (n : nat) : nat := n.
Definition repr_288 (n : nat) : nat := n.

Theorem retraction_288 : forall n : nat, abs_288 (repr_288 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_288.

