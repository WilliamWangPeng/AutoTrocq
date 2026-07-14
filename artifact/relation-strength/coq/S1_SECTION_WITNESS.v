(* RELATION_STRENGTH: section *)
(* POLICY_EXPECTED: accept *)

Definition embed_bool (b : bool) : nat := if b then 1 else 0.
Definition project_nat (n : nat) : bool := negb (Nat.eqb n 0).

Theorem bool_section :
  forall b : bool, project_nat (embed_bool b) = b.
Proof.
  destruct b; reflexivity.
Qed.

