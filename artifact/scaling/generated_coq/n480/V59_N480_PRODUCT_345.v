(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_345.
Definition pair_rel_345 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_345 : forall p : nat * nat, pair_rel_345 p p.
Proof.
  intro p.
  unfold pair_rel_345.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_345.

