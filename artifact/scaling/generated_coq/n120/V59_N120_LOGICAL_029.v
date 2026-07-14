(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: logical *)

Module V59_N120_LOGICAL_029.
Definition le_rel_29 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_29 :
  forall x y : nat, le_rel_29 x y -> le_rel_29 (S x) (S y).
Proof.
  unfold le_rel_29.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N120_LOGICAL_029.

