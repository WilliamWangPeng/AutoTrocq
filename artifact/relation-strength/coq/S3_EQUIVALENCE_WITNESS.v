(* RELATION_STRENGTH: equivalence *)
(* POLICY_EXPECTED: accept *)

Definition id_left (n : nat) : nat := n.
Definition id_right (n : nat) : nat := n.

Theorem nat_equivalence_left :
  forall n : nat, id_left (id_right n) = n.
Proof.
  intro n.
  reflexivity.
Qed.

Theorem nat_equivalence_right :
  forall n : nat, id_right (id_left n) = n.
Proof.
  intro n.
  reflexivity.
Qed.

