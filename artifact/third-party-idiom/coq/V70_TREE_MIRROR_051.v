Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_051.
Inductive v70_tree_51 : Type :=
| v70_leaf_51 : nat -> v70_tree_51
| v70_node_51 : v70_tree_51 -> v70_tree_51 -> v70_tree_51.

Fixpoint v70_mirror_51 (t : v70_tree_51) : v70_tree_51 :=
  match t with
  | v70_leaf_51 n => v70_leaf_51 n
  | v70_node_51 l r => v70_node_51 (v70_mirror_51 r) (v70_mirror_51 l)
  end.

Fixpoint v70_size_51 (t : v70_tree_51) : nat :=
  match t with
  | v70_leaf_51 _ => 1
  | v70_node_51 l r => 1 + v70_size_51 l + v70_size_51 r
  end.

Theorem v70_mirror_involutive_51 : forall t : v70_tree_51,
  v70_mirror_51 (v70_mirror_51 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_51 : forall n : nat,
  v70_mirror_51 (v70_leaf_51 n) = v70_leaf_51 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_051.

