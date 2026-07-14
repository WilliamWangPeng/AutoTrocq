(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: logical *)

Module V59_N480_LOGICAL_134.
Definition le_rel_134 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_134 :
  forall x y : nat, le_rel_134 x y -> le_rel_134 (S x) (S y).
Proof.
  unfold le_rel_134.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N480_LOGICAL_134.

