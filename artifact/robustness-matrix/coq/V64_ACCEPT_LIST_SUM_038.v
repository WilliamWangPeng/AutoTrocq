(* V64 robustness-matrix module *)
Module V64_ACCEPT_LIST_SUM_038.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.
Fixpoint sum_158 (xs : list nat) : nat := match xs with [] => 0 | x :: rest => x + sum_158 rest end.
Fixpoint sum_acc_158 (xs : list nat) (acc : nat) : nat := match xs with [] => acc | x :: rest => sum_acc_158 rest (acc + x) end.
Theorem acc_correct_158 : forall xs acc, sum_acc_158 xs acc = acc + sum_158 xs.
Proof. induction xs as [|x xs IH]; intro acc; simpl; [now rewrite Nat.add_0_r|rewrite IH; lia]. Qed.
Theorem zero_transfer_158 : forall xs, sum_acc_158 xs 0 = sum_158 xs.
Proof. intro xs; rewrite acc_correct_158; reflexivity. Qed.
End V64_ACCEPT_LIST_SUM_038.

