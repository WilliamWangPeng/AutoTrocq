Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_059.
Inductive v70_tree_59 : Type :=
| v70_leaf_59 : nat -> v70_tree_59
| v70_node_59 : v70_tree_59 -> v70_tree_59 -> v70_tree_59.

Fixpoint v70_mirror_59 (t : v70_tree_59) : v70_tree_59 :=
  match t with
  | v70_leaf_59 n => v70_leaf_59 n
  | v70_node_59 l r => v70_node_59 (v70_mirror_59 r) (v70_mirror_59 l)
  end.

Fixpoint v70_size_59 (t : v70_tree_59) : nat :=
  match t with
  | v70_leaf_59 _ => 1
  | v70_node_59 l r => 1 + v70_size_59 l + v70_size_59 r
  end.

Theorem v70_mirror_involutive_59 : forall t : v70_tree_59,
  v70_mirror_59 (v70_mirror_59 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_59 : forall n : nat,
  v70_mirror_59 (v70_leaf_59 n) = v70_leaf_59 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_059.

