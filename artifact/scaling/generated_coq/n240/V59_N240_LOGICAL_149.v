(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: logical *)

Module V59_N240_LOGICAL_149.
Definition le_rel_149 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_149 :
  forall x y : nat, le_rel_149 x y -> le_rel_149 (S x) (S y).
Proof.
  unfold le_rel_149.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N240_LOGICAL_149.

