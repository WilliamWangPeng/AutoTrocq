Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_PAIR_SWAP_077.
Definition v70_swap_77 (p : nat * nat) : nat * nat :=
  match p with (a, b) => (b, a) end.

Theorem v70_swap_involutive_77 : forall p : nat * nat,
  v70_swap_77 (v70_swap_77 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v70_swap_fst_77 : forall p : nat * nat,
  fst (v70_swap_77 p) = snd p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.
End V70_PAIR_SWAP_077.

