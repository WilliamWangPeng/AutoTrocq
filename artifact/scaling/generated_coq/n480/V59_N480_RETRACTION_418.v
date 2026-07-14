(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_418.
Definition abs_418 (n : nat) : nat := n.
Definition repr_418 (n : nat) : nat := n.

Theorem retraction_418 : forall n : nat, abs_418 (repr_418 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_418.

