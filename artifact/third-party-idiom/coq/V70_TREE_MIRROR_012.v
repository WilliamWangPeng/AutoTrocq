Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_012.
Inductive v70_tree_12 : Type :=
| v70_leaf_12 : nat -> v70_tree_12
| v70_node_12 : v70_tree_12 -> v70_tree_12 -> v70_tree_12.

Fixpoint v70_mirror_12 (t : v70_tree_12) : v70_tree_12 :=
  match t with
  | v70_leaf_12 n => v70_leaf_12 n
  | v70_node_12 l r => v70_node_12 (v70_mirror_12 r) (v70_mirror_12 l)
  end.

Fixpoint v70_size_12 (t : v70_tree_12) : nat :=
  match t with
  | v70_leaf_12 _ => 1
  | v70_node_12 l r => 1 + v70_size_12 l + v70_size_12 r
  end.

Theorem v70_mirror_involutive_12 : forall t : v70_tree_12,
  v70_mirror_12 (v70_mirror_12 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_12 : forall n : nat,
  v70_mirror_12 (v70_leaf_12 n) = v70_leaf_12 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_012.

