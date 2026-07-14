(* V58 generated module *)
(* CATEGORY: product *)

Module V58_PRODUCT_05.
Definition pair_rel_5 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_5 : forall p : nat * nat, pair_rel_5 p p.
Proof.
  intro p.
  unfold pair_rel_5.
  split; reflexivity.
Qed.
End V58_PRODUCT_05.

