(* RELATION_STRENGTH: plain *)
(* POLICY_EXPECTED: accept *)

Definition Rel (A B : Type) := A -> B -> Prop.

Definition parity_rel (n b : nat) : Prop := Nat.even n = Nat.even b.

Theorem plain_relation_reflexive :
  forall n : nat, parity_rel n n.
Proof.
  intro n.
  unfold parity_rel.
  reflexivity.
Qed.

