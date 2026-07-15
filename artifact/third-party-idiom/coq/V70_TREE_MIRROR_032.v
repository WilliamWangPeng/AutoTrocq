Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_032.
Inductive v70_tree_32 : Type :=
| v70_leaf_32 : nat -> v70_tree_32
| v70_node_32 : v70_tree_32 -> v70_tree_32 -> v70_tree_32.

Fixpoint v70_mirror_32 (t : v70_tree_32) : v70_tree_32 :=
  match t with
  | v70_leaf_32 n => v70_leaf_32 n
  | v70_node_32 l r => v70_node_32 (v70_mirror_32 r) (v70_mirror_32 l)
  end.

Fixpoint v70_size_32 (t : v70_tree_32) : nat :=
  match t with
  | v70_leaf_32 _ => 1
  | v70_node_32 l r => 1 + v70_size_32 l + v70_size_32 r
  end.

Theorem v70_mirror_involutive_32 : forall t : v70_tree_32,
  v70_mirror_32 (v70_mirror_32 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_32 : forall n : nat,
  v70_mirror_32 (v70_leaf_32 n) = v70_leaf_32 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_032.

