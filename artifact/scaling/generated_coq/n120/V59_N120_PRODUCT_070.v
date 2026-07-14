(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: product *)

Module V59_N120_PRODUCT_070.
Definition pair_rel_70 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_70 : forall p : nat * nat, pair_rel_70 p p.
Proof.
  intro p.
  unfold pair_rel_70.
  split; reflexivity.
Qed.
End V59_N120_PRODUCT_070.

