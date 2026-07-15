Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_060.
Inductive v70_tree_60 : Type :=
| v70_leaf_60 : nat -> v70_tree_60
| v70_node_60 : v70_tree_60 -> v70_tree_60 -> v70_tree_60.

Fixpoint v70_mirror_60 (t : v70_tree_60) : v70_tree_60 :=
  match t with
  | v70_leaf_60 n => v70_leaf_60 n
  | v70_node_60 l r => v70_node_60 (v70_mirror_60 r) (v70_mirror_60 l)
  end.

Fixpoint v70_size_60 (t : v70_tree_60) : nat :=
  match t with
  | v70_leaf_60 _ => 1
  | v70_node_60 l r => 1 + v70_size_60 l + v70_size_60 r
  end.

Theorem v70_mirror_involutive_60 : forall t : v70_tree_60,
  v70_mirror_60 (v70_mirror_60 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_60 : forall n : nat,
  v70_mirror_60 (v70_leaf_60 n) = v70_leaf_60 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_060.

