(* V59 generated scaling module *)
(* SIZE: 240 *)
(* CATEGORY: product *)

Module V59_N240_PRODUCT_210.
Definition pair_rel_210 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_210 : forall p : nat * nat, pair_rel_210 p p.
Proof.
  intro p.
  unfold pair_rel_210.
  split; reflexivity.
Qed.
End V59_N240_PRODUCT_210.

