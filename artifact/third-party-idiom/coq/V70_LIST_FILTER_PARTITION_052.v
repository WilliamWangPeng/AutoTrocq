Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_LIST_FILTER_PARTITION_052.
Theorem v70_filter_true_52 : forall xs : list nat,
  filter (fun _ => true) xs = xs.
Proof.
  induction xs; simpl; auto.
  now rewrite IHxs.
Qed.

Theorem v70_filter_false_52 : forall xs : list nat,
  filter (fun _ => false) xs = [].
Proof.
  induction xs; simpl; auto.
Qed.
End V70_LIST_FILTER_PARTITION_052.

