(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: product *)

Module V59_N120_PRODUCT_105.
Definition pair_rel_105 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_105 : forall p : nat * nat, pair_rel_105 p p.
Proof.
  intro p.
  unfold pair_rel_105.
  split; reflexivity.
Qed.
End V59_N120_PRODUCT_105.

