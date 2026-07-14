(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: retraction *)

Module V59_N480_RETRACTION_208.
Definition abs_208 (n : nat) : nat := n.
Definition repr_208 (n : nat) : nat := n.

Theorem retraction_208 : forall n : nat, abs_208 (repr_208 n) = n.
Proof.
  intro n.
  reflexivity.
Qed.
End V59_N480_RETRACTION_208.

