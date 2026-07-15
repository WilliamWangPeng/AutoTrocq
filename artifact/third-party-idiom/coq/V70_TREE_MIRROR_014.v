Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_014.
Inductive v70_tree_14 : Type :=
| v70_leaf_14 : nat -> v70_tree_14
| v70_node_14 : v70_tree_14 -> v70_tree_14 -> v70_tree_14.

Fixpoint v70_mirror_14 (t : v70_tree_14) : v70_tree_14 :=
  match t with
  | v70_leaf_14 n => v70_leaf_14 n
  | v70_node_14 l r => v70_node_14 (v70_mirror_14 r) (v70_mirror_14 l)
  end.

Fixpoint v70_size_14 (t : v70_tree_14) : nat :=
  match t with
  | v70_leaf_14 _ => 1
  | v70_node_14 l r => 1 + v70_size_14 l + v70_size_14 r
  end.

Theorem v70_mirror_involutive_14 : forall t : v70_tree_14,
  v70_mirror_14 (v70_mirror_14 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_14 : forall n : nat,
  v70_mirror_14 (v70_leaf_14 n) = v70_leaf_14 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_014.

