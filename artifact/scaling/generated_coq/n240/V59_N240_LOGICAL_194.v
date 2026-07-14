(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: logical *)

Module V59_N240_LOGICAL_194.
Definition le_rel_194 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_194 :
  forall x y : nat, le_rel_194 x y -> le_rel_194 (S x) (S y).
Proof.
  unfold le_rel_194.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N240_LOGICAL_194.

