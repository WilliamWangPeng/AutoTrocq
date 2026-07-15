Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_049.
Inductive v70_tree_49 : Type :=
| v70_leaf_49 : nat -> v70_tree_49
| v70_node_49 : v70_tree_49 -> v70_tree_49 -> v70_tree_49.

Fixpoint v70_mirror_49 (t : v70_tree_49) : v70_tree_49 :=
  match t with
  | v70_leaf_49 n => v70_leaf_49 n
  | v70_node_49 l r => v70_node_49 (v70_mirror_49 r) (v70_mirror_49 l)
  end.

Fixpoint v70_size_49 (t : v70_tree_49) : nat :=
  match t with
  | v70_leaf_49 _ => 1
  | v70_node_49 l r => 1 + v70_size_49 l + v70_size_49 r
  end.

Theorem v70_mirror_involutive_49 : forall t : v70_tree_49,
  v70_mirror_49 (v70_mirror_49 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_49 : forall n : nat,
  v70_mirror_49 (v70_leaf_49 n) = v70_leaf_49 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_049.

