(* V59 generated scaling module *)
(* SIZE: 480 *)
(* CATEGORY: product *)

Module V59_N480_PRODUCT_270.
Definition pair_rel_270 (p q : nat * nat) : Prop :=
  fst p = fst q /\ snd p = snd q.

Theorem pair_rel_refl_270 : forall p : nat * nat, pair_rel_270 p p.
Proof.
  intro p.
  unfold pair_rel_270.
  split; reflexivity.
Qed.
End V59_N480_PRODUCT_270.

