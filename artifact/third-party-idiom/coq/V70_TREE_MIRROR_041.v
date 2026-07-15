Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_041.
Inductive v70_tree_41 : Type :=
| v70_leaf_41 : nat -> v70_tree_41
| v70_node_41 : v70_tree_41 -> v70_tree_41 -> v70_tree_41.

Fixpoint v70_mirror_41 (t : v70_tree_41) : v70_tree_41 :=
  match t with
  | v70_leaf_41 n => v70_leaf_41 n
  | v70_node_41 l r => v70_node_41 (v70_mirror_41 r) (v70_mirror_41 l)
  end.

Fixpoint v70_size_41 (t : v70_tree_41) : nat :=
  match t with
  | v70_leaf_41 _ => 1
  | v70_node_41 l r => 1 + v70_size_41 l + v70_size_41 r
  end.

Theorem v70_mirror_involutive_41 : forall t : v70_tree_41,
  v70_mirror_41 (v70_mirror_41 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_41 : forall n : nat,
  v70_mirror_41 (v70_leaf_41 n) = v70_leaf_41 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_041.

