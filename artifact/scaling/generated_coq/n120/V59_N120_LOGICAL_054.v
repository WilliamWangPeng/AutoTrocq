(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: logical *)

Module V59_N120_LOGICAL_054.
Definition le_rel_54 (x y : nat) : Prop := x <= y.

Theorem logical_monotone_54 :
  forall x y : nat, le_rel_54 x y -> le_rel_54 (S x) (S y).
Proof.
  unfold le_rel_54.
  intros x y H.
  now apply le_n_S.
Qed.
End V59_N120_LOGICAL_054.

