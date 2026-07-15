Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_074.
Inductive v70_tree_74 : Type :=
| v70_leaf_74 : nat -> v70_tree_74
| v70_node_74 : v70_tree_74 -> v70_tree_74 -> v70_tree_74.

Fixpoint v70_mirror_74 (t : v70_tree_74) : v70_tree_74 :=
  match t with
  | v70_leaf_74 n => v70_leaf_74 n
  | v70_node_74 l r => v70_node_74 (v70_mirror_74 r) (v70_mirror_74 l)
  end.

Fixpoint v70_size_74 (t : v70_tree_74) : nat :=
  match t with
  | v70_leaf_74 _ => 1
  | v70_node_74 l r => 1 + v70_size_74 l + v70_size_74 r
  end.

Theorem v70_mirror_involutive_74 : forall t : v70_tree_74,
  v70_mirror_74 (v70_mirror_74 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_74 : forall n : nat,
  v70_mirror_74 (v70_leaf_74 n) = v70_leaf_74 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_074.

