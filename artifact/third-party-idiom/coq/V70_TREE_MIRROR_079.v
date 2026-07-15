Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_079.
Inductive v70_tree_79 : Type :=
| v70_leaf_79 : nat -> v70_tree_79
| v70_node_79 : v70_tree_79 -> v70_tree_79 -> v70_tree_79.

Fixpoint v70_mirror_79 (t : v70_tree_79) : v70_tree_79 :=
  match t with
  | v70_leaf_79 n => v70_leaf_79 n
  | v70_node_79 l r => v70_node_79 (v70_mirror_79 r) (v70_mirror_79 l)
  end.

Fixpoint v70_size_79 (t : v70_tree_79) : nat :=
  match t with
  | v70_leaf_79 _ => 1
  | v70_node_79 l r => 1 + v70_size_79 l + v70_size_79 r
  end.

Theorem v70_mirror_involutive_79 : forall t : v70_tree_79,
  v70_mirror_79 (v70_mirror_79 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_79 : forall n : nat,
  v70_mirror_79 (v70_leaf_79 n) = v70_leaf_79 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_079.

