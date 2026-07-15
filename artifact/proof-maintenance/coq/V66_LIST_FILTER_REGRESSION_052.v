Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_LIST_FILTER_REGRESSION_052.
Theorem v66_filter_true_52 : forall (xs : list nat),
  filter (fun _ => true) xs = xs.
Proof.
  induction xs; simpl.
  - reflexivity.
  - rewrite IHxs. reflexivity.
Qed.

Theorem v66_filter_false_52 : forall (xs : list nat),
  filter (fun _ => false) xs = [].
Proof.
  induction xs; simpl.
  - reflexivity.
  - rewrite IHxs. reflexivity.
Qed.
End V66_LIST_FILTER_REGRESSION_052.

