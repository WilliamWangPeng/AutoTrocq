(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_398.
Definition abs_398 (n : nat) : nat := n.
Definition repr_398 (n : nat) : nat := n.

Theorem retraction_398 : forall n : nat, abs_398 (repr_398 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_398.

