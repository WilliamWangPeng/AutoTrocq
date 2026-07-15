Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_023.
Inductive v70_tree_23 : Type :=
| v70_leaf_23 : nat -> v70_tree_23
| v70_node_23 : v70_tree_23 -> v70_tree_23 -> v70_tree_23.

Fixpoint v70_mirror_23 (t : v70_tree_23) : v70_tree_23 :=
  match t with
  | v70_leaf_23 n => v70_leaf_23 n
  | v70_node_23 l r => v70_node_23 (v70_mirror_23 r) (v70_mirror_23 l)
  end.

Fixpoint v70_size_23 (t : v70_tree_23) : nat :=
  match t with
  | v70_leaf_23 _ => 1
  | v70_node_23 l r => 1 + v70_size_23 l + v70_size_23 r
  end.

Theorem v70_mirror_involutive_23 : forall t : v70_tree_23,
  v70_mirror_23 (v70_mirror_23 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_23 : forall n : nat,
  v70_mirror_23 (v70_leaf_23 n) = v70_leaf_23 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_023.

