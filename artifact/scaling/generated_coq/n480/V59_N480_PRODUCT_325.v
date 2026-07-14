(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_325.
Definition pair_rel_325 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_325 : forall p : nat * nat, pair_rel_325 p p.
Proof.
  intro p.
  unfold pair_rel_325.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_325.

