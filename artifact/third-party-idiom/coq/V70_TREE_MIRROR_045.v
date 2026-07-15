Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_045.
Inductive v70_tree_45 : Type :=
| v70_leaf_45 : nat -> v70_tree_45
| v70_node_45 : v70_tree_45 -> v70_tree_45 -> v70_tree_45.

Fixpoint v70_mirror_45 (t : v70_tree_45) : v70_tree_45 :=
  match t with
  | v70_leaf_45 n => v70_leaf_45 n
  | v70_node_45 l r => v70_node_45 (v70_mirror_45 r) (v70_mirror_45 l)
  end.

Fixpoint v70_size_45 (t : v70_tree_45) : nat :=
  match t with
  | v70_leaf_45 _ => 1
  | v70_node_45 l r => 1 + v70_size_45 l + v70_size_45 r
  end.

Theorem v70_mirror_involutive_45 : forall t : v70_tree_45,
  v70_mirror_45 (v70_mirror_45 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_45 : forall n : nat,
  v70_mirror_45 (v70_leaf_45 n) = v70_leaf_45 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_045.

