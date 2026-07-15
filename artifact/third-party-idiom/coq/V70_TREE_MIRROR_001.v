Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_001.
Inductive v70_tree_1 : Type :=
| v70_leaf_1 : nat -> v70_tree_1
| v70_node_1 : v70_tree_1 -> v70_tree_1 -> v70_tree_1.

Fixpoint v70_mirror_1 (t : v70_tree_1) : v70_tree_1 :=
  match t with
  | v70_leaf_1 n => v70_leaf_1 n
  | v70_node_1 l r => v70_node_1 (v70_mirror_1 r) (v70_mirror_1 l)
  end.

Fixpoint v70_size_1 (t : v70_tree_1) : nat :=
  match t with
  | v70_leaf_1 _ => 1
  | v70_node_1 l r => 1 + v70_size_1 l + v70_size_1 r
  end.

Theorem v70_mirror_involutive_1 : forall t : v70_tree_1,
  v70_mirror_1 (v70_mirror_1 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_1 : forall n : nat,
  v70_mirror_1 (v70_leaf_1 n) = v70_leaf_1 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_001.

