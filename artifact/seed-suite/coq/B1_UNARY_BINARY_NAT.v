From Coq Require Import Arith.PeanoNat.
From Coq Require Import NArith.

(* Seed-family replay: unary/binary naturals. *)

Definition unary_binary_rel (n : nat) (m : N) : Prop :=
  m = N.of_nat n.

Lemma unary_binary_zero :
  unary_binary_rel 0 0%N.
Proof.
  reflexivity.
Qed.

Lemma unary_binary_succ :
  forall n m,
    unary_binary_rel n m ->
    unary_binary_rel (S n) (N.succ m).
Proof.
  intros n m H.
  unfold unary_binary_rel in *.
  subst.
  rewrite Nat2N.inj_succ.
  reflexivity.
Qed.

Lemma unary_binary_plus :
  forall a b ma mb,
    unary_binary_rel a ma ->
    unary_binary_rel b mb ->
    unary_binary_rel (a + b) (ma + mb)%N.
Proof.
  intros a b ma mb Ha Hb.
  unfold unary_binary_rel in *.
  subst.
  rewrite Nat2N.inj_add.
  reflexivity.
Qed.
