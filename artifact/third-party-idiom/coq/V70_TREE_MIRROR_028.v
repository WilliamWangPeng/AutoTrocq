Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_028.
Inductive v70_tree_28 : Type :=
| v70_leaf_28 : nat -> v70_tree_28
| v70_node_28 : v70_tree_28 -> v70_tree_28 -> v70_tree_28.

Fixpoint v70_mirror_28 (t : v70_tree_28) : v70_tree_28 :=
  match t with
  | v70_leaf_28 n => v70_leaf_28 n
  | v70_node_28 l r => v70_node_28 (v70_mirror_28 r) (v70_mirror_28 l)
  end.

Fixpoint v70_size_28 (t : v70_tree_28) : nat :=
  match t with
  | v70_leaf_28 _ => 1
  | v70_node_28 l r => 1 + v70_size_28 l + v70_size_28 r
  end.

Theorem v70_mirror_involutive_28 : forall t : v70_tree_28,
  v70_mirror_28 (v70_mirror_28 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_28 : forall n : nat,
  v70_mirror_28 (v70_leaf_28 n) = v70_leaf_28 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_028.

