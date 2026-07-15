Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_PAIR_MIGRATION_058.
Definition v66_swap_58 (p : nat * nat) : nat * nat :=
  match p with (a,b) => (b,a) end.

Theorem v66_swap_involutive_58 : forall p : nat * nat,
  v66_swap_58 (v66_swap_58 p) = p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.

Theorem v66_swap_sum_58 : forall p : nat * nat,
  fst (v66_swap_58 p) + snd (v66_swap_58 p) = snd p + fst p.
Proof.
  destruct p as [a b]. reflexivity.
Qed.
End V66_PAIR_MIGRATION_058.

