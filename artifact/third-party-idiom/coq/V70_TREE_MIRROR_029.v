Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_029.
Inductive v70_tree_29 : Type :=
| v70_leaf_29 : nat -> v70_tree_29
| v70_node_29 : v70_tree_29 -> v70_tree_29 -> v70_tree_29.

Fixpoint v70_mirror_29 (t : v70_tree_29) : v70_tree_29 :=
  match t with
  | v70_leaf_29 n => v70_leaf_29 n
  | v70_node_29 l r => v70_node_29 (v70_mirror_29 r) (v70_mirror_29 l)
  end.

Fixpoint v70_size_29 (t : v70_tree_29) : nat :=
  match t with
  | v70_leaf_29 _ => 1
  | v70_node_29 l r => 1 + v70_size_29 l + v70_size_29 r
  end.

Theorem v70_mirror_involutive_29 : forall t : v70_tree_29,
  v70_mirror_29 (v70_mirror_29 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_29 : forall n : nat,
  v70_mirror_29 (v70_leaf_29 n) = v70_leaf_29 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_029.

