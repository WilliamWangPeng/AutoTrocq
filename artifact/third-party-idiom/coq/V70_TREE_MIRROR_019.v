Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_019.
Inductive v70_tree_19 : Type :=
| v70_leaf_19 : nat -> v70_tree_19
| v70_node_19 : v70_tree_19 -> v70_tree_19 -> v70_tree_19.

Fixpoint v70_mirror_19 (t : v70_tree_19) : v70_tree_19 :=
  match t with
  | v70_leaf_19 n => v70_leaf_19 n
  | v70_node_19 l r => v70_node_19 (v70_mirror_19 r) (v70_mirror_19 l)
  end.

Fixpoint v70_size_19 (t : v70_tree_19) : nat :=
  match t with
  | v70_leaf_19 _ => 1
  | v70_node_19 l r => 1 + v70_size_19 l + v70_size_19 r
  end.

Theorem v70_mirror_involutive_19 : forall t : v70_tree_19,
  v70_mirror_19 (v70_mirror_19 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_19 : forall n : nat,
  v70_mirror_19 (v70_leaf_19 n) = v70_leaf_19 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_019.

