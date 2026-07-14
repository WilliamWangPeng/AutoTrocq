(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: logical *)

Module V59_N480_LOGICAL_249.
Definition le_rel_249 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_249 :
  forall x y : nat, le_rel_249 x y -> le_rel_249 (S x) (S y).
Proof.
  unfold le_rel_249.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N480_LOGICAL_249.

