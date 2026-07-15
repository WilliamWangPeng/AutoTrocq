Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_053.
Inductive v70_tree_53 : Type :=
| v70_leaf_53 : nat -> v70_tree_53
| v70_node_53 : v70_tree_53 -> v70_tree_53 -> v70_tree_53.

Fixpoint v70_mirror_53 (t : v70_tree_53) : v70_tree_53 :=
  match t with
  | v70_leaf_53 n => v70_leaf_53 n
  | v70_node_53 l r => v70_node_53 (v70_mirror_53 r) (v70_mirror_53 l)
  end.

Fixpoint v70_size_53 (t : v70_tree_53) : nat :=
  match t with
  | v70_leaf_53 _ => 1
  | v70_node_53 l r => 1 + v70_size_53 l + v70_size_53 r
  end.

Theorem v70_mirror_involutive_53 : forall t : v70_tree_53,
  v70_mirror_53 (v70_mirror_53 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_53 : forall n : nat,
  v70_mirror_53 (v70_leaf_53 n) = v70_leaf_53 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_053.

