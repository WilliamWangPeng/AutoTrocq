(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: logical *)

Module V59_N240_LOGICAL_179.
Definition le_rel_179 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_179 :
  forall x y : nat, le_rel_179 x y -> le_rel_179 (S x) (S y).
Proof.
  unfold le_rel_179.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N240_LOGICAL_179.

