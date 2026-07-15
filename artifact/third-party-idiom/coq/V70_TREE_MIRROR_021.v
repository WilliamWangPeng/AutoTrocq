Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_021.
Inductive v70_tree_21 : Type :=
| v70_leaf_21 : nat -> v70_tree_21
| v70_node_21 : v70_tree_21 -> v70_tree_21 -> v70_tree_21.

Fixpoint v70_mirror_21 (t : v70_tree_21) : v70_tree_21 :=
  match t with
  | v70_leaf_21 n => v70_leaf_21 n
  | v70_node_21 l r => v70_node_21 (v70_mirror_21 r) (v70_mirror_21 l)
  end.

Fixpoint v70_size_21 (t : v70_tree_21) : nat :=
  match t with
  | v70_leaf_21 _ => 1
  | v70_node_21 l r => 1 + v70_size_21 l + v70_size_21 r
  end.

Theorem v70_mirror_involutive_21 : forall t : v70_tree_21,
  v70_mirror_21 (v70_mirror_21 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_21 : forall n : nat,
  v70_mirror_21 (v70_leaf_21 n) = v70_leaf_21 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_021.

