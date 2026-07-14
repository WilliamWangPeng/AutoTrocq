(* V58 generated module *)
(* CATEGORY: product *)

Module V58_PRODUCT_25.
Definition pair_rel_25 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_25 : forall p : nat * nat, pair_rel_25 p p.
Proof.
  intro p.
  unfold pair_rel_25.
  split; reflexivity.
Qed.
End V58_PRODUCT_25.

