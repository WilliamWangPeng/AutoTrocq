(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_015.
Definition pair_rel_15 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_15 : forall p : nat * nat, pair_rel_15 p p.
Proof.
  intro p.
  unfold pair_rel_15.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_015.

