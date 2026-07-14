(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_223.
Definition abs_223 (n : nat) : nat := n.
Definition repr_223 (n : nat) : nat := n.

Theorem retraction_223 : forall n : nat, abs_223 (repr_223 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_223.

