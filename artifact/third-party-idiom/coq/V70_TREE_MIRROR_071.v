Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_071.
Inductive v70_tree_71 : Type :=
| v70_leaf_71 : nat -> v70_tree_71
| v70_node_71 : v70_tree_71 -> v70_tree_71 -> v70_tree_71.

Fixpoint v70_mirror_71 (t : v70_tree_71) : v70_tree_71 :=
  match t with
  | v70_leaf_71 n => v70_leaf_71 n
  | v70_node_71 l r => v70_node_71 (v70_mirror_71 r) (v70_mirror_71 l)
  end.

Fixpoint v70_size_71 (t : v70_tree_71) : nat :=
  match t with
  | v70_leaf_71 _ => 1
  | v70_node_71 l r => 1 + v70_size_71 l + v70_size_71 r
  end.

Theorem v70_mirror_involutive_71 : forall t : v70_tree_71,
  v70_mirror_71 (v70_mirror_71 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_71 : forall n : nat,
  v70_mirror_71 (v70_leaf_71 n) = v70_leaf_71 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_071.

