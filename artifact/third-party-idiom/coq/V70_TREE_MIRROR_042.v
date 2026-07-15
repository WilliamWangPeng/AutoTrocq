Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_042.
Inductive v70_tree_42 : Type :=
| v70_leaf_42 : nat -> v70_tree_42
| v70_node_42 : v70_tree_42 -> v70_tree_42 -> v70_tree_42.

Fixpoint v70_mirror_42 (t : v70_tree_42) : v70_tree_42 :=
  match t with
  | v70_leaf_42 n => v70_leaf_42 n
  | v70_node_42 l r => v70_node_42 (v70_mirror_42 r) (v70_mirror_42 l)
  end.

Fixpoint v70_size_42 (t : v70_tree_42) : nat :=
  match t with
  | v70_leaf_42 _ => 1
  | v70_node_42 l r => 1 + v70_size_42 l + v70_size_42 r
  end.

Theorem v70_mirror_involutive_42 : forall t : v70_tree_42,
  v70_mirror_42 (v70_mirror_42 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_42 : forall n : nat,
  v70_mirror_42 (v70_leaf_42 n) = v70_leaf_42 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_042.

