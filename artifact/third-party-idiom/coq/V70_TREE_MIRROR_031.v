Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_031.
Inductive v70_tree_31 : Type :=
| v70_leaf_31 : nat -> v70_tree_31
| v70_node_31 : v70_tree_31 -> v70_tree_31 -> v70_tree_31.

Fixpoint v70_mirror_31 (t : v70_tree_31) : v70_tree_31 :=
  match t with
  | v70_leaf_31 n => v70_leaf_31 n
  | v70_node_31 l r => v70_node_31 (v70_mirror_31 r) (v70_mirror_31 l)
  end.

Fixpoint v70_size_31 (t : v70_tree_31) : nat :=
  match t with
  | v70_leaf_31 _ => 1
  | v70_node_31 l r => 1 + v70_size_31 l + v70_size_31 r
  end.

Theorem v70_mirror_involutive_31 : forall t : v70_tree_31,
  v70_mirror_31 (v70_mirror_31 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_31 : forall n : nat,
  v70_mirror_31 (v70_leaf_31 n) = v70_leaf_31 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_031.

