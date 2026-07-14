(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: product *)

Module V59_N240_PRODUCT_010.
Definition pair_rel_10 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_10 : forall p : nat * nat, pair_rel_10 p p.
Proof.
  intro p.
  unfold pair_rel_10.
  split; reflexivity.
Qed.
End V59_N240_PRODUCT_010.

