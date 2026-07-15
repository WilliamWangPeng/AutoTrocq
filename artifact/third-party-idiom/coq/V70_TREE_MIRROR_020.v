Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_020.
Inductive v70_tree_20 : Type :=
| v70_leaf_20 : nat -> v70_tree_20
| v70_node_20 : v70_tree_20 -> v70_tree_20 -> v70_tree_20.

Fixpoint v70_mirror_20 (t : v70_tree_20) : v70_tree_20 :=
  match t with
  | v70_leaf_20 n => v70_leaf_20 n
  | v70_node_20 l r => v70_node_20 (v70_mirror_20 r) (v70_mirror_20 l)
  end.

Fixpoint v70_size_20 (t : v70_tree_20) : nat :=
  match t with
  | v70_leaf_20 _ => 1
  | v70_node_20 l r => 1 + v70_size_20 l + v70_size_20 r
  end.

Theorem v70_mirror_involutive_20 : forall t : v70_tree_20,
  v70_mirror_20 (v70_mirror_20 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_20 : forall n : nat,
  v70_mirror_20 (v70_leaf_20 n) = v70_leaf_20 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_020.

