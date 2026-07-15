Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_016.
Inductive v70_tree_16 : Type :=
| v70_leaf_16 : nat -> v70_tree_16
| v70_node_16 : v70_tree_16 -> v70_tree_16 -> v70_tree_16.

Fixpoint v70_mirror_16 (t : v70_tree_16) : v70_tree_16 :=
  match t with
  | v70_leaf_16 n => v70_leaf_16 n
  | v70_node_16 l r => v70_node_16 (v70_mirror_16 r) (v70_mirror_16 l)
  end.

Fixpoint v70_size_16 (t : v70_tree_16) : nat :=
  match t with
  | v70_leaf_16 _ => 1
  | v70_node_16 l r => 1 + v70_size_16 l + v70_size_16 r
  end.

Theorem v70_mirror_involutive_16 : forall t : v70_tree_16,
  v70_mirror_16 (v70_mirror_16 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_16 : forall n : nat,
  v70_mirror_16 (v70_leaf_16 n) = v70_leaf_16 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_016.

