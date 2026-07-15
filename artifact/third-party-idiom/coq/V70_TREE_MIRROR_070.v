Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_070.
Inductive v70_tree_70 : Type :=
| v70_leaf_70 : nat -> v70_tree_70
| v70_node_70 : v70_tree_70 -> v70_tree_70 -> v70_tree_70.

Fixpoint v70_mirror_70 (t : v70_tree_70) : v70_tree_70 :=
  match t with
  | v70_leaf_70 n => v70_leaf_70 n
  | v70_node_70 l r => v70_node_70 (v70_mirror_70 r) (v70_mirror_70 l)
  end.

Fixpoint v70_size_70 (t : v70_tree_70) : nat :=
  match t with
  | v70_leaf_70 _ => 1
  | v70_node_70 l r => 1 + v70_size_70 l + v70_size_70 r
  end.

Theorem v70_mirror_involutive_70 : forall t : v70_tree_70,
  v70_mirror_70 (v70_mirror_70 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_70 : forall n : nat,
  v70_mirror_70 (v70_leaf_70 n) = v70_leaf_70 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_070.

