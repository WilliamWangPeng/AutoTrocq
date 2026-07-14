(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_370.
Definition pair_rel_370 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_370 : forall p : nat * nat, pair_rel_370 p p.
Proof.
  intro p.
  unfold pair_rel_370.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_370.

