Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_LIST_MAP_REGRESSION_052.
Theorem v66_map_length_52 : forall (xs : list nat),
  length (map S xs) = length xs.
Proof.
  induction xs; simpl; auto.
Qed.

Theorem v66_map_app_52 : forall (xs ys : list nat),
  map S (xs ++ ys) = map S xs ++ map S ys.
Proof.
  induction xs; simpl; intros; auto.
  rewrite IHxs. reflexivity.
Qed.
End V66_LIST_MAP_REGRESSION_052.

