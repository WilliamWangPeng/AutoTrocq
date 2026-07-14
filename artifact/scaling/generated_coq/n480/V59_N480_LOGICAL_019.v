(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: logical *)

Module V59_N480_LOGICAL_019.
Definition le_rel_19 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_19 :
  forall x y : nat, le_rel_19 x y -> le_rel_19 (S x) (S y).
Proof.
  unfold le_rel_19.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N480_LOGICAL_019.

