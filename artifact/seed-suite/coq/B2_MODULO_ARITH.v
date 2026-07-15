From Coq Require Import Arith.PeanoNat.

(* Seed-family replay: modulo arithmetic as a retraction-style quotient view. *)

Definition mod_rel (m x y : nat) : Prop :=
  y = x mod m.

Lemma mod_rel_intro :
  forall m x, mod_rel m x (x mod m).
Proof.
  intros; unfold mod_rel; reflexivity.
Qed.

Lemma mod_rel_respects_eq :
  forall m x x' y,
    x = x' ->
    mod_rel m x y ->
    mod_rel m x' y.
Proof.
  intros m x x' y Hx H.
  subst.
  exact H.
Qed.

Lemma mod_rel_idempotent :
  forall m x y,
    m <> 0 ->
    mod_rel m x y ->
    mod_rel m y y.
Proof.
  intros m x y Hm H.
  unfold mod_rel in *.
  subst.
  rewrite Nat.mod_mod by exact Hm.
  reflexivity.
Qed.
