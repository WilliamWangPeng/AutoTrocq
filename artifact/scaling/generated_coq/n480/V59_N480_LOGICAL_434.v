(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: logical *)

Module V59_N480_LOGICAL_434.
Definition le_rel_434 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_434 :
  forall x y : nat, le_rel_434 x y -> le_rel_434 (S x) (S y).
Proof.
  unfold le_rel_434.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N480_LOGICAL_434.

