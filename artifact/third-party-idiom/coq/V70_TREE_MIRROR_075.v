Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_075.
Inductive v70_tree_75 : Type :=
| v70_leaf_75 : nat -> v70_tree_75
| v70_node_75 : v70_tree_75 -> v70_tree_75 -> v70_tree_75.

Fixpoint v70_mirror_75 (t : v70_tree_75) : v70_tree_75 :=
  match t with
  | v70_leaf_75 n => v70_leaf_75 n
  | v70_node_75 l r => v70_node_75 (v70_mirror_75 r) (v70_mirror_75 l)
  end.

Fixpoint v70_size_75 (t : v70_tree_75) : nat :=
  match t with
  | v70_leaf_75 _ => 1
  | v70_node_75 l r => 1 + v70_size_75 l + v70_size_75 r
  end.

Theorem v70_mirror_involutive_75 : forall t : v70_tree_75,
  v70_mirror_75 (v70_mirror_75 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_75 : forall n : nat,
  v70_mirror_75 (v70_leaf_75 n) = v70_leaf_75 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_075.

