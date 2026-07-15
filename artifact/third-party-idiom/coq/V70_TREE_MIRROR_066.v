Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_066.
Inductive v70_tree_66 : Type :=
| v70_leaf_66 : nat -> v70_tree_66
| v70_node_66 : v70_tree_66 -> v70_tree_66 -> v70_tree_66.

Fixpoint v70_mirror_66 (t : v70_tree_66) : v70_tree_66 :=
  match t with
  | v70_leaf_66 n => v70_leaf_66 n
  | v70_node_66 l r => v70_node_66 (v70_mirror_66 r) (v70_mirror_66 l)
  end.

Fixpoint v70_size_66 (t : v70_tree_66) : nat :=
  match t with
  | v70_leaf_66 _ => 1
  | v70_node_66 l r => 1 + v70_size_66 l + v70_size_66 r
  end.

Theorem v70_mirror_involutive_66 : forall t : v70_tree_66,
  v70_mirror_66 (v70_mirror_66 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_66 : forall n : nat,
  v70_mirror_66 (v70_leaf_66 n) = v70_leaf_66 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_066.

