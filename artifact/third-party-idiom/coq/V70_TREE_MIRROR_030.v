Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_030.
Inductive v70_tree_30 : Type :=
| v70_leaf_30 : nat -> v70_tree_30
| v70_node_30 : v70_tree_30 -> v70_tree_30 -> v70_tree_30.

Fixpoint v70_mirror_30 (t : v70_tree_30) : v70_tree_30 :=
  match t with
  | v70_leaf_30 n => v70_leaf_30 n
  | v70_node_30 l r => v70_node_30 (v70_mirror_30 r) (v70_mirror_30 l)
  end.

Fixpoint v70_size_30 (t : v70_tree_30) : nat :=
  match t with
  | v70_leaf_30 _ => 1
  | v70_node_30 l r => 1 + v70_size_30 l + v70_size_30 r
  end.

Theorem v70_mirror_involutive_30 : forall t : v70_tree_30,
  v70_mirror_30 (v70_mirror_30 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_30 : forall n : nat,
  v70_mirror_30 (v70_leaf_30 n) = v70_leaf_30 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_030.

