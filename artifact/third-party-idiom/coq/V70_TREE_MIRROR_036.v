Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_036.
Inductive v70_tree_36 : Type :=
| v70_leaf_36 : nat -> v70_tree_36
| v70_node_36 : v70_tree_36 -> v70_tree_36 -> v70_tree_36.

Fixpoint v70_mirror_36 (t : v70_tree_36) : v70_tree_36 :=
  match t with
  | v70_leaf_36 n => v70_leaf_36 n
  | v70_node_36 l r => v70_node_36 (v70_mirror_36 r) (v70_mirror_36 l)
  end.

Fixpoint v70_size_36 (t : v70_tree_36) : nat :=
  match t with
  | v70_leaf_36 _ => 1
  | v70_node_36 l r => 1 + v70_size_36 l + v70_size_36 r
  end.

Theorem v70_mirror_involutive_36 : forall t : v70_tree_36,
  v70_mirror_36 (v70_mirror_36 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_36 : forall n : nat,
  v70_mirror_36 (v70_leaf_36 n) = v70_leaf_36 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_036.

