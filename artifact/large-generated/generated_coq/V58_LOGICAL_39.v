(* V58 generated module *)
(* CATEGORY: logical *)

Module V58_LOGICAL_39.
Definition le_rel_39 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_39 :
  forall x y : nat, le_rel_39 x y -> le_rel_39 (S x) (S y).
Proof.
  unfold le_rel_39.
  intros x y H.
  now apply le_n_S.
Qed.
End V58_LOGICAL_39.

