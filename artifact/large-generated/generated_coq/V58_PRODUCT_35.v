(* V58 generated module *)
(* CATEGORY: product *)

Module V58_PRODUCT_35.
Definition pair_rel_35 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_35 : forall p : nat * nat, pair_rel_35 p p.
Proof.
  intro p.
  unfold pair_rel_35.
  split; reflexivity.
Qed.
End V58_PRODUCT_35.

