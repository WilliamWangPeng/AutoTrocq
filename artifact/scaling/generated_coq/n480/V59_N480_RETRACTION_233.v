(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_233.
Definition abs_233 (n : nat) : nat := n.
Definition repr_233 (n : nat) : nat := n.

Theorem retraction_233 : forall n : nat, abs_233 (repr_233 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_233.

