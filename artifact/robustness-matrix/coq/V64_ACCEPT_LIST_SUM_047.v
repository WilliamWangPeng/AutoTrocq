(* V64 robustness-matrix module *)
Module V64_ACCEPT_LIST_SUM_047.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.
Fixpoint sum_167 (xs : list nat) : nat := match xs with [] => 0 | x :: rest => x + sum_167 rest end.
Fixpoint sum_acc_167 (xs : list nat) (acc : nat) : nat := match xs with [] => acc | x :: rest => sum_acc_167 rest (acc + x) end.
Theorem acc_correct_167 : forall xs acc, sum_acc_167 xs acc = acc + sum_167 xs.
Proof. induction xs as [|x xs IH]; intro acc; simpl; [now rewrite Nat.add_0_r|rewrite IH; lia]. Qed.
Theorem zero_transfer_167 : forall xs, sum_acc_167 xs 0 = sum_167 xs.
Proof. intro xs; rewrite acc_correct_167; reflexivity. Qed.
End V64_ACCEPT_LIST_SUM_047.

