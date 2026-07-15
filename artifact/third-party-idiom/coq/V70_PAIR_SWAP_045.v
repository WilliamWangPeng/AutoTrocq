Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_PAIR_SWAP_045.
Definition v70_swap_45 (p : nat * nat) : nat * nat :=
  match p with (a, b) => (b, a) end.

Theorem v70_swap_involutive_45 : forall p : nat * nat,
  v70_swap_45 (v70_swap_45 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_swap_fst_45 : forall p : nat * nat,
  fst (v70_swap_45 p) = snd p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.
End V70_PAIR_SWAP_045.

