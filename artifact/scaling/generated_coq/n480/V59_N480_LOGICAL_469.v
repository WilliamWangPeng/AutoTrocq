(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: logical *)

Module V59_N480_LOGICAL_469.
Definition le_rel_469 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_469 :
  forall x y : nat, le_rel_469 x y -> le_rel_469 (S x) (S y).
Proof.
  unfold le_rel_469.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N480_LOGICAL_469.

