Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_LIST_MAP_APP_067.
Theorem v70_map_app_67 : forall xs ys : list nat,
  map S (xs ++ ys) = map S xs ++ map S ys.
Proof.
  induction xs; simpl; intros; auto.
  now rewrite IHxs.
Qed.

Theorem v70_map_length_67 : forall xs : list nat,
  length (map S xs) = length xs.
Proof.
  induction xs; simpl; auto.
Qed.
End V70_LIST_MAP_APP_067.

