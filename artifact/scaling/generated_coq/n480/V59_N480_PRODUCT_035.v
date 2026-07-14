(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_035.
Definition pair_rel_35 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_35 : forall p : nat * nat, pair_rel_35 p p.
Proof.
  intro p.
  unfold pair_rel_35.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_035.

