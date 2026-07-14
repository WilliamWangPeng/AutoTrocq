(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: logical *)

Module V59_N120_LOGICAL_059.
Definition le_rel_59 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_59 :
  forall x y : nat, le_rel_59 x y -> le_rel_59 (S x) (S y).
Proof.
  unfold le_rel_59.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N120_LOGICAL_059.

