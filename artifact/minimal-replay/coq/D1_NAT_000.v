From Coq Require Import Arith.PeanoNat.

(* Minimal kernel-candidate witness for D1-NAT-000.
   This file is deliberately small: its value is that the stated transfer
   obligations are accepted by the Coq kernel in a clean replay. *)

Definition nat_rel (x y : nat) : Prop := x = y.

Lemma nat_rel_refl : forall n, nat_rel n n.
Proof.
  intros n; reflexivity.
Qed.

Lemma plus_transfer :
  forall a a' b b',
    nat_rel a a' ->
    nat_rel b b' ->
    nat_rel (a + b) (a' + b').
Proof.
  intros a a' b b' Ha Hb.
  unfold nat_rel in *.
  subst.
  reflexivity.
Qed.

Lemma mult_transfer :
  forall a a' b b',
    nat_rel a a' ->
    nat_rel b b' ->
    nat_rel (a * b) (a' * b').
Proof.
  intros a a' b b' Ha Hb.
  unfold nat_rel in *.
  subst.
  reflexivity.
Qed.

Lemma le_transfer :
  forall a a' b b',
    nat_rel a a' ->
    nat_rel b b' ->
    a <= b ->
    a' <= b'.
Proof.
  intros a a' b b' Ha Hb Hle.
  unfold nat_rel in *.
  subst.
  exact Hle.
Qed.
