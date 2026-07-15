Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_013.
Inductive v70_tree_13 : Type :=
| v70_leaf_13 : nat -> v70_tree_13
| v70_node_13 : v70_tree_13 -> v70_tree_13 -> v70_tree_13.

Fixpoint v70_mirror_13 (t : v70_tree_13) : v70_tree_13 :=
  match t with
  | v70_leaf_13 n => v70_leaf_13 n
  | v70_node_13 l r => v70_node_13 (v70_mirror_13 r) (v70_mirror_13 l)
  end.

Fixpoint v70_size_13 (t : v70_tree_13) : nat :=
  match t with
  | v70_leaf_13 _ => 1
  | v70_node_13 l r => 1 + v70_size_13 l + v70_size_13 r
  end.

Theorem v70_mirror_involutive_13 : forall t : v70_tree_13,
  v70_mirror_13 (v70_mirror_13 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_13 : forall n : nat,
  v70_mirror_13 (v70_leaf_13 n) = v70_leaf_13 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_013.

