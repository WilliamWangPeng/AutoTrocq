Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_026.
Inductive v70_tree_26 : Type :=
| v70_leaf_26 : nat -> v70_tree_26
| v70_node_26 : v70_tree_26 -> v70_tree_26 -> v70_tree_26.

Fixpoint v70_mirror_26 (t : v70_tree_26) : v70_tree_26 :=
  match t with
  | v70_leaf_26 n => v70_leaf_26 n
  | v70_node_26 l r => v70_node_26 (v70_mirror_26 r) (v70_mirror_26 l)
  end.

Fixpoint v70_size_26 (t : v70_tree_26) : nat :=
  match t with
  | v70_leaf_26 _ => 1
  | v70_node_26 l r => 1 + v70_size_26 l + v70_size_26 r
  end.

Theorem v70_mirror_involutive_26 : forall t : v70_tree_26,
  v70_mirror_26 (v70_mirror_26 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_26 : forall n : nat,
  v70_mirror_26 (v70_leaf_26 n) = v70_leaf_26 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_026.

