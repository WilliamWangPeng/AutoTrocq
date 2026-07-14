(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_108.
Definition abs_108 (n : nat) : nat := n.
Definition repr_108 (n : nat) : nat := n.

Theorem retraction_108 : forall n : nat, abs_108 (repr_108 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_108.

