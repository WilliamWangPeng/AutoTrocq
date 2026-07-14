(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_313.
Definition abs_313 (n : nat) : nat := n.
Definition repr_313 (n : nat) : nat := n.

Theorem retraction_313 : forall n : nat, abs_313 (repr_313 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_313.

