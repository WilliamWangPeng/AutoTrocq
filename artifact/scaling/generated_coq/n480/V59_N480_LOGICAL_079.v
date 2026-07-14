(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: logical *)

Module V59_N480_LOGICAL_079.
Definition le_rel_79 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_79 :
  forall x y : nat, le_rel_79 x y -> le_rel_79 (S x) (S y).
Proof.
  unfold le_rel_79.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N480_LOGICAL_079.

