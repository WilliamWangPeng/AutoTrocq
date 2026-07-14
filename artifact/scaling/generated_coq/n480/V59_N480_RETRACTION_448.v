(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_448.
Definition abs_448 (n : nat) : nat := n.
Definition repr_448 (n : nat) : nat := n.

Theorem retraction_448 : forall n : nat, abs_448 (repr_448 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_448.

