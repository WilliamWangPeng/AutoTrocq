Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_018.
Inductive v70_tree_18 : Type :=
| v70_leaf_18 : nat -> v70_tree_18
| v70_node_18 : v70_tree_18 -> v70_tree_18 -> v70_tree_18.

Fixpoint v70_mirror_18 (t : v70_tree_18) : v70_tree_18 :=
  match t with
  | v70_leaf_18 n => v70_leaf_18 n
  | v70_node_18 l r => v70_node_18 (v70_mirror_18 r) (v70_mirror_18 l)
  end.

Fixpoint v70_size_18 (t : v70_tree_18) : nat :=
  match t with
  | v70_leaf_18 _ => 1
  | v70_node_18 l r => 1 + v70_size_18 l + v70_size_18 r
  end.

Theorem v70_mirror_involutive_18 : forall t : v70_tree_18,
  v70_mirror_18 (v70_mirror_18 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_18 : forall n : nat,
  v70_mirror_18 (v70_leaf_18 n) = v70_leaf_18 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_018.

