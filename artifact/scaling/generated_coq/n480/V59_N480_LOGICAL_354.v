(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: logical *)

Module V59_N480_LOGICAL_354.
Definition le_rel_354 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_354 :
  forall x y : nat, le_rel_354 x y -> le_rel_354 (S x) (S y).
Proof.
  unfold le_rel_354.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N480_LOGICAL_354.

