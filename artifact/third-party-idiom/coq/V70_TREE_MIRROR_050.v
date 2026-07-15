Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_050.
Inductive v70_tree_50 : Type :=
| v70_leaf_50 : nat -> v70_tree_50
| v70_node_50 : v70_tree_50 -> v70_tree_50 -> v70_tree_50.

Fixpoint v70_mirror_50 (t : v70_tree_50) : v70_tree_50 :=
  match t with
  | v70_leaf_50 n => v70_leaf_50 n
  | v70_node_50 l r => v70_node_50 (v70_mirror_50 r) (v70_mirror_50 l)
  end.

Fixpoint v70_size_50 (t : v70_tree_50) : nat :=
  match t with
  | v70_leaf_50 _ => 1
  | v70_node_50 l r => 1 + v70_size_50 l + v70_size_50 r
  end.

Theorem v70_mirror_involutive_50 : forall t : v70_tree_50,
  v70_mirror_50 (v70_mirror_50 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_50 : forall n : nat,
  v70_mirror_50 (v70_leaf_50 n) = v70_leaf_50 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_050.

