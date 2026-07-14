(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_228.
Definition abs_228 (n : nat) : nat := n.
Definition repr_228 (n : nat) : nat := n.

Theorem retraction_228 : forall n : nat, abs_228 (repr_228 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_228.

