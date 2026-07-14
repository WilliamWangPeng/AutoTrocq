(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_048.
Definition abs_48 (n : nat) : nat := n.
Definition repr_48 (n : nat) : nat := n.

Theorem retraction_48 : forall n : nat, abs_48 (repr_48 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_048.

