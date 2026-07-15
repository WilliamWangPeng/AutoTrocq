Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_024.
Inductive v70_tree_24 : Type :=
| v70_leaf_24 : nat -> v70_tree_24
| v70_node_24 : v70_tree_24 -> v70_tree_24 -> v70_tree_24.

Fixpoint v70_mirror_24 (t : v70_tree_24) : v70_tree_24 :=
  match t with
  | v70_leaf_24 n => v70_leaf_24 n
  | v70_node_24 l r => v70_node_24 (v70_mirror_24 r) (v70_mirror_24 l)
  end.

Fixpoint v70_size_24 (t : v70_tree_24) : nat :=
  match t with
  | v70_leaf_24 _ => 1
  | v70_node_24 l r => 1 + v70_size_24 l + v70_size_24 r
  end.

Theorem v70_mirror_involutive_24 : forall t : v70_tree_24,
  v70_mirror_24 (v70_mirror_24 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_24 : forall n : nat,
  v70_mirror_24 (v70_leaf_24 n) = v70_leaf_24 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_024.

