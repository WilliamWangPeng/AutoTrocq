(* V58 generated module *)
(* CATEGORY: logical *)

Module V58_LOGICAL_44.
Definition le_rel_44 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_44 :
  forall x y : nat, le_rel_44 x y -> le_rel_44 (S x) (S y).
Proof.
  unfold le_rel_44.
  intros x y H.
  now apply le_n_S.
Qed.
End V58_LOGICAL_44.

