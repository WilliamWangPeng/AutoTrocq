Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_002.
Inductive v70_tree_2 : Type :=
| v70_leaf_2 : nat -> v70_tree_2
| v70_node_2 : v70_tree_2 -> v70_tree_2 -> v70_tree_2.

Fixpoint v70_mirror_2 (t : v70_tree_2) : v70_tree_2 :=
  match t with
  | v70_leaf_2 n => v70_leaf_2 n
  | v70_node_2 l r => v70_node_2 (v70_mirror_2 r) (v70_mirror_2 l)
  end.

Fixpoint v70_size_2 (t : v70_tree_2) : nat :=
  match t with
  | v70_leaf_2 _ => 1
  | v70_node_2 l r => 1 + v70_size_2 l + v70_size_2 r
  end.

Theorem v70_mirror_involutive_2 : forall t : v70_tree_2,
  v70_mirror_2 (v70_mirror_2 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_2 : forall n : nat,
  v70_mirror_2 (v70_leaf_2 n) = v70_leaf_2 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_002.

