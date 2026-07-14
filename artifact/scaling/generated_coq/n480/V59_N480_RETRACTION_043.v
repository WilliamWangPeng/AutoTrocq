(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_043.
Definition abs_43 (n : nat) : nat := n.
Definition repr_43 (n : nat) : nat := n.

Theorem retraction_43 : forall n : nat, abs_43 (repr_43 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_043.

