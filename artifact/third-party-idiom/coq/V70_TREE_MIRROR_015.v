Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_015.
Inductive v70_tree_15 : Type :=
| v70_leaf_15 : nat -> v70_tree_15
| v70_node_15 : v70_tree_15 -> v70_tree_15 -> v70_tree_15.

Fixpoint v70_mirror_15 (t : v70_tree_15) : v70_tree_15 :=
  match t with
  | v70_leaf_15 n => v70_leaf_15 n
  | v70_node_15 l r => v70_node_15 (v70_mirror_15 r) (v70_mirror_15 l)
  end.

Fixpoint v70_size_15 (t : v70_tree_15) : nat :=
  match t with
  | v70_leaf_15 _ => 1
  | v70_node_15 l r => 1 + v70_size_15 l + v70_size_15 r
  end.

Theorem v70_mirror_involutive_15 : forall t : v70_tree_15,
  v70_mirror_15 (v70_mirror_15 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_15 : forall n : nat,
  v70_mirror_15 (v70_leaf_15 n) = v70_leaf_15 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_015.

