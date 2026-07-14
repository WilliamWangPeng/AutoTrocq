(* V58 generated module *)
(* CATEGORY: product *)

Module V58_PRODUCT_45.
Definition pair_rel_45 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_45 : forall p : nat * nat, pair_rel_45 p p.
Proof.
  intro p.
  unfold pair_rel_45.
  split; reflexivity.
Qed.
End V58_PRODUCT_45.

