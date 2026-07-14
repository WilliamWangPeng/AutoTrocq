(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_380.
Definition pair_rel_380 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_380 : forall p : nat * nat, pair_rel_380 p p.
Proof.
  intro p.
  unfold pair_rel_380.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_380.

