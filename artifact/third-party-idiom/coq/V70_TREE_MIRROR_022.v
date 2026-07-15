Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_022.
Inductive v70_tree_22 : Type :=
| v70_leaf_22 : nat -> v70_tree_22
| v70_node_22 : v70_tree_22 -> v70_tree_22 -> v70_tree_22.

Fixpoint v70_mirror_22 (t : v70_tree_22) : v70_tree_22 :=
  match t with
  | v70_leaf_22 n => v70_leaf_22 n
  | v70_node_22 l r => v70_node_22 (v70_mirror_22 r) (v70_mirror_22 l)
  end.

Fixpoint v70_size_22 (t : v70_tree_22) : nat :=
  match t with
  | v70_leaf_22 _ => 1
  | v70_node_22 l r => 1 + v70_size_22 l + v70_size_22 r
  end.

Theorem v70_mirror_involutive_22 : forall t : v70_tree_22,
  v70_mirror_22 (v70_mirror_22 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_22 : forall n : nat,
  v70_mirror_22 (v70_leaf_22 n) = v70_leaf_22 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_022.

