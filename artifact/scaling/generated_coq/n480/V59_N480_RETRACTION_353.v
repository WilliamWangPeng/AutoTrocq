(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_353.
Definition abs_353 (n : nat) : nat := n.
Definition repr_353 (n : nat) : nat := n.

Theorem retraction_353 : forall n : nat, abs_353 (repr_353 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_353.

