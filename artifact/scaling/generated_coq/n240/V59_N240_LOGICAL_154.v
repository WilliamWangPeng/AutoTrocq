(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: logical *)

Module V59_N240_LOGICAL_154.
Definition le_rel_154 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_154 :
  forall x y : nat, le_rel_154 x y -> le_rel_154 (S x) (S y).
Proof.
  unfold le_rel_154.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N240_LOGICAL_154.

