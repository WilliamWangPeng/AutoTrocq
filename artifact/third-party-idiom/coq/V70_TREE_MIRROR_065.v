Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_065.
Inductive v70_tree_65 : Type :=
| v70_leaf_65 : nat -> v70_tree_65
| v70_node_65 : v70_tree_65 -> v70_tree_65 -> v70_tree_65.

Fixpoint v70_mirror_65 (t : v70_tree_65) : v70_tree_65 :=
  match t with
  | v70_leaf_65 n => v70_leaf_65 n
  | v70_node_65 l r => v70_node_65 (v70_mirror_65 r) (v70_mirror_65 l)
  end.

Fixpoint v70_size_65 (t : v70_tree_65) : nat :=
  match t with
  | v70_leaf_65 _ => 1
  | v70_node_65 l r => 1 + v70_size_65 l + v70_size_65 r
  end.

Theorem v70_mirror_involutive_65 : forall t : v70_tree_65,
  v70_mirror_65 (v70_mirror_65 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_65 : forall n : nat,
  v70_mirror_65 (v70_leaf_65 n) = v70_leaf_65 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_065.

