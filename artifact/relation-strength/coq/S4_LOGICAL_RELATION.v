(* RELATION_STRENGTH: logical *)
(* POLICY_EXPECTED: accept *)

Definition le_rel (x y : nat) : Prop := x <= y.

Theorem logical_relation_monotone :
  forall x y : nat, le_rel x y -> le_rel (S x) (S y).
Proof.
  unfold le_rel.
  intros x y H.
  now apply le_n_S.
Qed.

