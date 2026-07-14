(* V58 generated module *)
(* CATEGORY: logical *)

Module V58_LOGICAL_54.
Definition le_rel_54 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_54 :
  forall x y : nat, le_rel_54 x y -> le_rel_54 (S x) (S y).
Proof.
  unfold le_rel_54.
  intros x y H.
  now apply le_n_S.
Qed.
End V58_LOGICAL_54.

