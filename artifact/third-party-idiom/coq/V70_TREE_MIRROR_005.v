Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_005.
Inductive v70_tree_5 : Type :=
| v70_leaf_5 : nat -> v70_tree_5
| v70_node_5 : v70_tree_5 -> v70_tree_5 -> v70_tree_5.

Fixpoint v70_mirror_5 (t : v70_tree_5) : v70_tree_5 :=
  match t with
  | v70_leaf_5 n => v70_leaf_5 n
  | v70_node_5 l r => v70_node_5 (v70_mirror_5 r) (v70_mirror_5 l)
  end.

Fixpoint v70_size_5 (t : v70_tree_5) : nat :=
  match t with
  | v70_leaf_5 _ => 1
  | v70_node_5 l r => 1 + v70_size_5 l + v70_size_5 r
  end.

Theorem v70_mirror_involutive_5 : forall t : v70_tree_5,
  v70_mirror_5 (v70_mirror_5 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_5 : forall n : nat,
  v70_mirror_5 (v70_leaf_5 n) = v70_leaf_5 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_005.

