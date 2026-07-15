(* V64 robustness-matrix module *)
Module V64_ACCEPT_LIST_SUM_025.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.
Fixpoint sum_145 (xs : list nat) : nat := match xs with [] => 0 | x :: rest => x + sum_145 rest end.
Fixpoint sum_acc_145 (xs : list nat) (acc : nat) : nat := match xs with [] => acc | x :: rest => sum_acc_145 rest (acc + x) end.
Theorem acc_correct_145 : forall xs acc, sum_acc_145 xs acc = acc + sum_145 xs.
Proof. induction xs as [|x xs IH]; intro acc; simpl; [now rewrite Nat.add_0_r|rewrite IH; lia]. Qed.
Theorem zero_transfer_145 : forall xs, sum_acc_145 xs 0 = sum_145 xs.
Proof. intro xs; rewrite acc_correct_145; reflexivity. Qed.
End V64_ACCEPT_LIST_SUM_025.

