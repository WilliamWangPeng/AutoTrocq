Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_064.
Inductive v70_tree_64 : Type :=
| v70_leaf_64 : nat -> v70_tree_64
| v70_node_64 : v70_tree_64 -> v70_tree_64 -> v70_tree_64.

Fixpoint v70_mirror_64 (t : v70_tree_64) : v70_tree_64 :=
  match t with
  | v70_leaf_64 n => v70_leaf_64 n
  | v70_node_64 l r => v70_node_64 (v70_mirror_64 r) (v70_mirror_64 l)
  end.

Fixpoint v70_size_64 (t : v70_tree_64) : nat :=
  match t with
  | v70_leaf_64 _ => 1
  | v70_node_64 l r => 1 + v70_size_64 l + v70_size_64 r
  end.

Theorem v70_mirror_involutive_64 : forall t : v70_tree_64,
  v70_mirror_64 (v70_mirror_64 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_64 : forall n : nat,
  v70_mirror_64 (v70_leaf_64 n) = v70_leaf_64 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_064.

