(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: logical *)

Module V59_N240_LOGICAL_169.
Definition le_rel_169 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_169 :
  forall x y : nat, le_rel_169 x y -> le_rel_169 (S x) (S y).
Proof.
  unfold le_rel_169.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N240_LOGICAL_169.

