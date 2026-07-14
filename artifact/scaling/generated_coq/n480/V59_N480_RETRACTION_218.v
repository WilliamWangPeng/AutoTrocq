(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_218.
Definition abs_218 (n : nat) : nat := n.
Definition repr_218 (n : nat) : nat := n.

Theorem retraction_218 : forall n : nat, abs_218 (repr_218 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_218.

