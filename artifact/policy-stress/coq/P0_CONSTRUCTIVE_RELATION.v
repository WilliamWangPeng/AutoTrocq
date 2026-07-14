(* AXIOM_CLASS: none *)
(* POLICY_EXPECTED: accept *)

Set Implicit Arguments.

Definition Rel (A B : Type) := A -> B -> Prop.

Definition nat_id_rel : Rel nat nat := fun x y => x = y.

Theorem constructive_transfer_id :
  forall n m : nat, nat_id_rel n m -> nat_id_rel (S n) (S m).
Proof.
  unfold nat_id_rel.
  intros n m H.
  now rewrite H.
Qed.

