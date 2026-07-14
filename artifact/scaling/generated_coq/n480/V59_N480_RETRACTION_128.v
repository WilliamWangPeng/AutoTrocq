(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_128.
Definition abs_128 (n : nat) : nat := n.
Definition repr_128 (n : nat) : nat := n.

Theorem retraction_128 : forall n : nat, abs_128 (repr_128 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_128.

