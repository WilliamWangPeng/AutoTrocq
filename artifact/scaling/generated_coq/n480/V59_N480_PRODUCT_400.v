(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_400.
Definition pair_rel_400 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_400 : forall p : nat * nat, pair_rel_400 p p.
Proof.
  intro p.
  unfold pair_rel_400.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_400.

