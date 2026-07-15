Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_007.
Inductive v70_tree_7 : Type :=
| v70_leaf_7 : nat -> v70_tree_7
| v70_node_7 : v70_tree_7 -> v70_tree_7 -> v70_tree_7.

Fixpoint v70_mirror_7 (t : v70_tree_7) : v70_tree_7 :=
  match t with
  | v70_leaf_7 n => v70_leaf_7 n
  | v70_node_7 l r => v70_node_7 (v70_mirror_7 r) (v70_mirror_7 l)
  end.

Fixpoint v70_size_7 (t : v70_tree_7) : nat :=
  match t with
  | v70_leaf_7 _ => 1
  | v70_node_7 l r => 1 + v70_size_7 l + v70_size_7 r
  end.

Theorem v70_mirror_involutive_7 : forall t : v70_tree_7,
  v70_mirror_7 (v70_mirror_7 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_7 : forall n : nat,
  v70_mirror_7 (v70_leaf_7 n) = v70_leaf_7 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_007.

