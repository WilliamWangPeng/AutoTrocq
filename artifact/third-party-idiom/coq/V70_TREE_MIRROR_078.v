Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_078.
Inductive v70_tree_78 : Type :=
| v70_leaf_78 : nat -> v70_tree_78
| v70_node_78 : v70_tree_78 -> v70_tree_78 -> v70_tree_78.

Fixpoint v70_mirror_78 (t : v70_tree_78) : v70_tree_78 :=
  match t with
  | v70_leaf_78 n => v70_leaf_78 n
  | v70_node_78 l r => v70_node_78 (v70_mirror_78 r) (v70_mirror_78 l)
  end.

Fixpoint v70_size_78 (t : v70_tree_78) : nat :=
  match t with
  | v70_leaf_78 _ => 1
  | v70_node_78 l r => 1 + v70_size_78 l + v70_size_78 r
  end.

Theorem v70_mirror_involutive_78 : forall t : v70_tree_78,
  v70_mirror_78 (v70_mirror_78 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_78 : forall n : nat,
  v70_mirror_78 (v70_leaf_78 n) = v70_leaf_78 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_078.

