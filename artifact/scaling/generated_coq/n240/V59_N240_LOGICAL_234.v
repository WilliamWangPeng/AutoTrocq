(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: logical *)

Module V59_N240_LOGICAL_234.
Definition le_rel_234 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_234 :
  forall x y : nat, le_rel_234 x y -> le_rel_234 (S x) (S y).
Proof.
  unfold le_rel_234.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N240_LOGICAL_234.

