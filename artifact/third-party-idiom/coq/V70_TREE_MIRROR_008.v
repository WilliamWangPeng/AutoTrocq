Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_008.
Inductive v70_tree_8 : Type :=
| v70_leaf_8 : nat -> v70_tree_8
| v70_node_8 : v70_tree_8 -> v70_tree_8 -> v70_tree_8.

Fixpoint v70_mirror_8 (t : v70_tree_8) : v70_tree_8 :=
  match t with
  | v70_leaf_8 n => v70_leaf_8 n
  | v70_node_8 l r => v70_node_8 (v70_mirror_8 r) (v70_mirror_8 l)
  end.

Fixpoint v70_size_8 (t : v70_tree_8) : nat :=
  match t with
  | v70_leaf_8 _ => 1
  | v70_node_8 l r => 1 + v70_size_8 l + v70_size_8 r
  end.

Theorem v70_mirror_involutive_8 : forall t : v70_tree_8,
  v70_mirror_8 (v70_mirror_8 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_8 : forall n : nat,
  v70_mirror_8 (v70_leaf_8 n) = v70_leaf_8 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_008.

