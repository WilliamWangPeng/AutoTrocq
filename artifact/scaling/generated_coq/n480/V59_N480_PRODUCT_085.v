(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_085.
Definition pair_rel_85 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_85 : forall p : nat * nat, pair_rel_85 p p.
Proof.
  intro p.
  unfold pair_rel_85.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_085.

