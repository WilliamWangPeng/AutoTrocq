Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_006.
Inductive v70_tree_6 : Type :=
| v70_leaf_6 : nat -> v70_tree_6
| v70_node_6 : v70_tree_6 -> v70_tree_6 -> v70_tree_6.

Fixpoint v70_mirror_6 (t : v70_tree_6) : v70_tree_6 :=
  match t with
  | v70_leaf_6 n => v70_leaf_6 n
  | v70_node_6 l r => v70_node_6 (v70_mirror_6 r) (v70_mirror_6 l)
  end.

Fixpoint v70_size_6 (t : v70_tree_6) : nat :=
  match t with
  | v70_leaf_6 _ => 1
  | v70_node_6 l r => 1 + v70_size_6 l + v70_size_6 r
  end.

Theorem v70_mirror_involutive_6 : forall t : v70_tree_6,
  v70_mirror_6 (v70_mirror_6 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_6 : forall n : nat,
  v70_mirror_6 (v70_leaf_6 n) = v70_leaf_6 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_006.

