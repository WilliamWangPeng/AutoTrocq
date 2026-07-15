Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_PAIR_SWAP_069.
Definition v70_swap_69 (p : nat * nat) : nat * nat :=
  match p with (a, b) => (b, a) end.

Theorem v70_swap_involutive_69 : forall p : nat * nat,
  v70_swap_69 (v70_swap_69 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_swap_fst_69 : forall p : nat * nat,
  fst (v70_swap_69 p) = snd p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.
End V70_PAIR_SWAP_069.

