(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_255.
Definition pair_rel_255 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_255 : forall p : nat * nat, pair_rel_255 p p.
Proof.
  intro p.
  unfold pair_rel_255.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_255.

