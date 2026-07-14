(* V59 generated scaling module *)
(* SIZE: 120 *)
(* CATEGORY: product *)

Module V59_N120_PRODUCT_045.
Definition pair_rel_45 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_45 : forall p : nat * nat, pair_rel_45 p p.
Proof.
  intro p.
  unfold pair_rel_45.
  split; reflexivity.
Qed.
End V59_N120_PRODUCT_045.

