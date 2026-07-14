(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: logical *)

Module V59_N480_LOGICAL_309.
Definition le_rel_309 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_309 :
  forall x y : nat, le_rel_309 x y -> le_rel_309 (S x) (S y).
Proof.
  unfold le_rel_309.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N480_LOGICAL_309.

