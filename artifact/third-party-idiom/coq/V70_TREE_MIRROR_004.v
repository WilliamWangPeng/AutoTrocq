Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_004.
Inductive v70_tree_4 : Type :=
| v70_leaf_4 : nat -> v70_tree_4
| v70_node_4 : v70_tree_4 -> v70_tree_4 -> v70_tree_4.

Fixpoint v70_mirror_4 (t : v70_tree_4) : v70_tree_4 :=
  match t with
  | v70_leaf_4 n => v70_leaf_4 n
  | v70_node_4 l r => v70_node_4 (v70_mirror_4 r) (v70_mirror_4 l)
  end.

Fixpoint v70_size_4 (t : v70_tree_4) : nat :=
  match t with
  | v70_leaf_4 _ => 1
  | v70_node_4 l r => 1 + v70_size_4 l + v70_size_4 r
  end.

Theorem v70_mirror_involutive_4 : forall t : v70_tree_4,
  v70_mirror_4 (v70_mirror_4 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_4 : forall n : nat,
  v70_mirror_4 (v70_leaf_4 n) = v70_leaf_4 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_004.

