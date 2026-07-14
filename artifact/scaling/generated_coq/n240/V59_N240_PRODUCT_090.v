(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: product *)

Module V59_N240_PRODUCT_090.
Definition pair_rel_90 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_90 : forall p : nat * nat, pair_rel_90 p p.
Proof.
  intro p.
  unfold pair_rel_90.
  split; reflexivity.
Qed.
End V59_N240_PRODUCT_090.

