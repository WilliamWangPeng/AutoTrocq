(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_308.
Definition abs_308 (n : nat) : nat := n.
Definition repr_308 (n : nat) : nat := n.

Theorem retraction_308 : forall n : nat, abs_308 (repr_308 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_308.

