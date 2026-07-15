Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_011.
Inductive v70_tree_11 : Type :=
| v70_leaf_11 : nat -> v70_tree_11
| v70_node_11 : v70_tree_11 -> v70_tree_11 -> v70_tree_11.

Fixpoint v70_mirror_11 (t : v70_tree_11) : v70_tree_11 :=
  match t with
  | v70_leaf_11 n => v70_leaf_11 n
  | v70_node_11 l r => v70_node_11 (v70_mirror_11 r) (v70_mirror_11 l)
  end.

Fixpoint v70_size_11 (t : v70_tree_11) : nat :=
  match t with
  | v70_leaf_11 _ => 1
  | v70_node_11 l r => 1 + v70_size_11 l + v70_size_11 r
  end.

Theorem v70_mirror_involutive_11 : forall t : v70_tree_11,
  v70_mirror_11 (v70_mirror_11 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_11 : forall n : nat,
  v70_mirror_11 (v70_leaf_11 n) = v70_leaf_11 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_011.

