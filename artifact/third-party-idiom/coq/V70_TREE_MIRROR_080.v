Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_080.
Inductive v70_tree_80 : Type :=
| v70_leaf_80 : nat -> v70_tree_80
| v70_node_80 : v70_tree_80 -> v70_tree_80 -> v70_tree_80.

Fixpoint v70_mirror_80 (t : v70_tree_80) : v70_tree_80 :=
  match t with
  | v70_leaf_80 n => v70_leaf_80 n
  | v70_node_80 l r => v70_node_80 (v70_mirror_80 r) (v70_mirror_80 l)
  end.

Fixpoint v70_size_80 (t : v70_tree_80) : nat :=
  match t with
  | v70_leaf_80 _ => 1
  | v70_node_80 l r => 1 + v70_size_80 l + v70_size_80 r
  end.

Theorem v70_mirror_involutive_80 : forall t : v70_tree_80,
  v70_mirror_80 (v70_mirror_80 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_80 : forall n : nat,
  v70_mirror_80 (v70_leaf_80 n) = v70_leaf_80 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_080.

