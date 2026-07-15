(* V64 robustness-matrix module *)
Module V64_ACCEPT_LIST_SUM_053.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.
Fixpoint sum_173 (xs : list nat) : nat := match xs with [] => 0 | x :: rest => x + sum_173 rest end.
Fixpoint sum_acc_173 (xs : list nat) (acc : nat) : nat := match xs with [] => acc | x :: rest => sum_acc_173 rest (acc + x) end.
Theorem acc_correct_173 : forall xs acc, sum_acc_173 xs acc = acc + sum_173 xs.
Proof. induction xs as [|x xs IH]; intro acc; simpl; [now rewrite Nat.add_0_r|rewrite IH; lia]. Qed.
Theorem zero_transfer_173 : forall xs, sum_acc_173 xs 0 = sum_173 xs.
Proof. intro xs; rewrite acc_correct_173; reflexivity. Qed.
End V64_ACCEPT_LIST_SUM_053.

