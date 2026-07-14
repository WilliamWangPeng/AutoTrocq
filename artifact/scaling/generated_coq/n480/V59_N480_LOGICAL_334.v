(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: logical *)

Module V59_N480_LOGICAL_334.
Definition le_rel_334 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_334 :
  forall x y : nat, le_rel_334 x y -> le_rel_334 (S x) (S y).
Proof.
  unfold le_rel_334.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N480_LOGICAL_334.

