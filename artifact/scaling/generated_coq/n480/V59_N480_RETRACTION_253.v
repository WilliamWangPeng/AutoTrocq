(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_253.
Definition abs_253 (n : nat) : nat := n.
Definition repr_253 (n : nat) : nat := n.

Theorem retraction_253 : forall n : nat, abs_253 (repr_253 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_253.

