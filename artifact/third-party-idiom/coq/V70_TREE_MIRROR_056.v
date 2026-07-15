Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_056.
Inductive v70_tree_56 : Type :=
| v70_leaf_56 : nat -> v70_tree_56
| v70_node_56 : v70_tree_56 -> v70_tree_56 -> v70_tree_56.

Fixpoint v70_mirror_56 (t : v70_tree_56) : v70_tree_56 :=
  match t with
  | v70_leaf_56 n => v70_leaf_56 n
  | v70_node_56 l r => v70_node_56 (v70_mirror_56 r) (v70_mirror_56 l)
  end.

Fixpoint v70_size_56 (t : v70_tree_56) : nat :=
  match t with
  | v70_leaf_56 _ => 1
  | v70_node_56 l r => 1 + v70_size_56 l + v70_size_56 r
  end.

Theorem v70_mirror_involutive_56 : forall t : v70_tree_56,
  v70_mirror_56 (v70_mirror_56 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_56 : forall n : nat,
  v70_mirror_56 (v70_leaf_56 n) = v70_leaf_56 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_056.

