Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_009.
Inductive v70_tree_9 : Type :=
| v70_leaf_9 : nat -> v70_tree_9
| v70_node_9 : v70_tree_9 -> v70_tree_9 -> v70_tree_9.

Fixpoint v70_mirror_9 (t : v70_tree_9) : v70_tree_9 :=
  match t with
  | v70_leaf_9 n => v70_leaf_9 n
  | v70_node_9 l r => v70_node_9 (v70_mirror_9 r) (v70_mirror_9 l)
  end.

Fixpoint v70_size_9 (t : v70_tree_9) : nat :=
  match t with
  | v70_leaf_9 _ => 1
  | v70_node_9 l r => 1 + v70_size_9 l + v70_size_9 r
  end.

Theorem v70_mirror_involutive_9 : forall t : v70_tree_9,
  v70_mirror_9 (v70_mirror_9 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_9 : forall n : nat,
  v70_mirror_9 (v70_leaf_9 n) = v70_leaf_9 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_009.

