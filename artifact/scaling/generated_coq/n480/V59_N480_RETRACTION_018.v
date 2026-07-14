(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_018.
Definition abs_18 (n : nat) : nat := n.
Definition repr_18 (n : nat) : nat := n.

Theorem retraction_18 : forall n : nat, abs_18 (repr_18 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_018.

