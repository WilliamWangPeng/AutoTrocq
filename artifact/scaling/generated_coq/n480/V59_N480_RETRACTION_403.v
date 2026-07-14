(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_403.
Definition abs_403 (n : nat) : nat := n.
Definition repr_403 (n : nat) : nat := n.

Theorem retraction_403 : forall n : nat, abs_403 (repr_403 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_403.

