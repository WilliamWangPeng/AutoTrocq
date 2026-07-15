Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_PAIR_MIGRATION_041.
Definition v66_swap_41 (p : nat * nat) : nat * nat :=
  match p with (a,b) => (b,a) end.

Theorem v66_swap_involutive_41 : forall p : nat * nat,
  v66_swap_41 (v66_swap_41 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_swap_sum_41 : forall p : nat * nat,
  fst (v66_swap_41 p) + snd (v66_swap_41 p) = snd p + fst p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.
End V66_PAIR_MIGRATION_041.

