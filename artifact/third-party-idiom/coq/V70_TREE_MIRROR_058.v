Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_058.
Inductive v70_tree_58 : Type :=
| v70_leaf_58 : nat -> v70_tree_58
| v70_node_58 : v70_tree_58 -> v70_tree_58 -> v70_tree_58.

Fixpoint v70_mirror_58 (t : v70_tree_58) : v70_tree_58 :=
  match t with
  | v70_leaf_58 n => v70_leaf_58 n
  | v70_node_58 l r => v70_node_58 (v70_mirror_58 r) (v70_mirror_58 l)
  end.

Fixpoint v70_size_58 (t : v70_tree_58) : nat :=
  match t with
  | v70_leaf_58 _ => 1
  | v70_node_58 l r => 1 + v70_size_58 l + v70_size_58 r
  end.

Theorem v70_mirror_involutive_58 : forall t : v70_tree_58,
  v70_mirror_58 (v70_mirror_58 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_58 : forall n : nat,
  v70_mirror_58 (v70_leaf_58 n) = v70_leaf_58 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_058.

