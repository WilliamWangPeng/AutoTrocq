(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_258.
Definition abs_258 (n : nat) : nat := n.
Definition repr_258 (n : nat) : nat := n.

Theorem retraction_258 : forall n : nat, abs_258 (repr_258 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_258.

