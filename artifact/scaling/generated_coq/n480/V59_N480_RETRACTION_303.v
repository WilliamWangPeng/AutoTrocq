(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_303.
Definition abs_303 (n : nat) : nat := n.
Definition repr_303 (n : nat) : nat := n.

Theorem retraction_303 : forall n : nat, abs_303 (repr_303 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_303.

