(* RELATION_STRENGTH: retraction *)
(* POLICY_EXPECTED: accept *)

Definition abs_nat (n : nat) : nat := n.
Definition repr_nat (n : nat) : nat := n.

Theorem nat_retraction :
  forall n : nat, abs_nat (repr_nat n) = n.
Proof.
  intro n.
  reflexivity.
Qed.

