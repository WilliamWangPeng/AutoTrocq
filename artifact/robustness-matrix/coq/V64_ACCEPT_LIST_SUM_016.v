(* V64 robustness-matrix module *)
Module V64_ACCEPT_LIST_SUM_016.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.
Fixpoint sum_136 (xs : list nat) : nat := match xs with [] => 0 | x :: rest => x + sum_136 rest end.
Fixpoint sum_acc_136 (xs : list nat) (acc : nat) : nat := match xs with [] => acc | x :: rest => sum_acc_136 rest (acc + x) end.
Theorem acc_correct_136 : forall xs acc, sum_acc_136 xs acc = acc + sum_136 xs.
Proof. induction xs as [|x xs IH]; intro acc; simpl; [now rewrite Nat.add_0_r|rewrite IH; lia]. Qed.
Theorem zero_transfer_136 : forall xs, sum_acc_136 xs 0 = sum_136 xs.
Proof. intro xs; rewrite acc_correct_136; reflexivity. Qed.
End V64_ACCEPT_LIST_SUM_016.

