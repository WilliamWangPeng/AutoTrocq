Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_040.
Inductive v70_tree_40 : Type :=
| v70_leaf_40 : nat -> v70_tree_40
| v70_node_40 : v70_tree_40 -> v70_tree_40 -> v70_tree_40.

Fixpoint v70_mirror_40 (t : v70_tree_40) : v70_tree_40 :=
  match t with
  | v70_leaf_40 n => v70_leaf_40 n
  | v70_node_40 l r => v70_node_40 (v70_mirror_40 r) (v70_mirror_40 l)
  end.

Fixpoint v70_size_40 (t : v70_tree_40) : nat :=
  match t with
  | v70_leaf_40 _ => 1
  | v70_node_40 l r => 1 + v70_size_40 l + v70_size_40 r
  end.

Theorem v70_mirror_involutive_40 : forall t : v70_tree_40,
  v70_mirror_40 (v70_mirror_40 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_40 : forall n : nat,
  v70_mirror_40 (v70_leaf_40 n) = v70_leaf_40 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_040.

