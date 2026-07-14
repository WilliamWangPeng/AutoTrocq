(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: logical *)

Module V59_N480_LOGICAL_404.
Definition le_rel_404 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_404 :
  forall x y : nat, le_rel_404 x y -> le_rel_404 (S x) (S y).
Proof.
  unfold le_rel_404.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N480_LOGICAL_404.

