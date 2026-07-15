(* V64 robustness-matrix module *)
Module V64_ACCEPT_LIST_SUM_021.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.
Fixpoint sum_141 (xs : list nat) : nat := match xs with [] => 0 | x :: rest => x + sum_141 rest end.
Fixpoint sum_acc_141 (xs : list nat) (acc : nat) : nat := match xs with [] => acc | x :: rest => sum_acc_141 rest (acc + x) end.
Theorem acc_correct_141 : forall xs acc, sum_acc_141 xs acc = acc + sum_141 xs.
Proof. induction xs as [|x xs IH]; intro acc; simpl; [now rewrite Nat.add_0_r|rewrite IH; lia]. Qed.
Theorem zero_transfer_141 : forall xs, sum_acc_141 xs 0 = sum_141 xs.
Proof. intro xs; rewrite acc_correct_141; reflexivity. Qed.
End V64_ACCEPT_LIST_SUM_021.

