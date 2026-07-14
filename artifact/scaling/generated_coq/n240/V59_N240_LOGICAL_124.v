(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: logical *)

Module V59_N240_LOGICAL_124.
Definition le_rel_124 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_124 :
  forall x y : nat, le_rel_124 x y -> le_rel_124 (S x) (S y).
Proof.
  unfold le_rel_124.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N240_LOGICAL_124.

