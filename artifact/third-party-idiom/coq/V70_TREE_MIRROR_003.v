Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_003.
Inductive v70_tree_3 : Type :=
| v70_leaf_3 : nat -> v70_tree_3
| v70_node_3 : v70_tree_3 -> v70_tree_3 -> v70_tree_3.

Fixpoint v70_mirror_3 (t : v70_tree_3) : v70_tree_3 :=
  match t with
  | v70_leaf_3 n => v70_leaf_3 n
  | v70_node_3 l r => v70_node_3 (v70_mirror_3 r) (v70_mirror_3 l)
  end.

Fixpoint v70_size_3 (t : v70_tree_3) : nat :=
  match t with
  | v70_leaf_3 _ => 1
  | v70_node_3 l r => 1 + v70_size_3 l + v70_size_3 r
  end.

Theorem v70_mirror_involutive_3 : forall t : v70_tree_3,
  v70_mirror_3 (v70_mirror_3 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_3 : forall n : nat,
  v70_mirror_3 (v70_leaf_3 n) = v70_leaf_3 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_003.

