(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_428.
Definition abs_428 (n : nat) : nat := n.
Definition repr_428 (n : nat) : nat := n.

Theorem retraction_428 : forall n : nat, abs_428 (repr_428 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_428.

