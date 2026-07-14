(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_385.
Definition pair_rel_385 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_385 : forall p : nat * nat, pair_rel_385 p p.
Proof.
  intro p.
  unfold pair_rel_385.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_385.

