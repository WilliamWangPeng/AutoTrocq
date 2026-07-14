(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_318.
Definition abs_318 (n : nat) : nat := n.
Definition repr_318 (n : nat) : nat := n.

Theorem retraction_318 : forall n : nat, abs_318 (repr_318 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_318.

