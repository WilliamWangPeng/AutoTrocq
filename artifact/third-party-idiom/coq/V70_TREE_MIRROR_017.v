Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_017.
Inductive v70_tree_17 : Type :=
| v70_leaf_17 : nat -> v70_tree_17
| v70_node_17 : v70_tree_17 -> v70_tree_17 -> v70_tree_17.

Fixpoint v70_mirror_17 (t : v70_tree_17) : v70_tree_17 :=
  match t with
  | v70_leaf_17 n => v70_leaf_17 n
  | v70_node_17 l r => v70_node_17 (v70_mirror_17 r) (v70_mirror_17 l)
  end.

Fixpoint v70_size_17 (t : v70_tree_17) : nat :=
  match t with
  | v70_leaf_17 _ => 1
  | v70_node_17 l r => 1 + v70_size_17 l + v70_size_17 r
  end.

Theorem v70_mirror_involutive_17 : forall t : v70_tree_17,
  v70_mirror_17 (v70_mirror_17 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_17 : forall n : nat,
  v70_mirror_17 (v70_leaf_17 n) = v70_leaf_17 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_017.

