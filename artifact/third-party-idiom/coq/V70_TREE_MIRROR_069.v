Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_069.
Inductive v70_tree_69 : Type :=
| v70_leaf_69 : nat -> v70_tree_69
| v70_node_69 : v70_tree_69 -> v70_tree_69 -> v70_tree_69.

Fixpoint v70_mirror_69 (t : v70_tree_69) : v70_tree_69 :=
  match t with
  | v70_leaf_69 n => v70_leaf_69 n
  | v70_node_69 l r => v70_node_69 (v70_mirror_69 r) (v70_mirror_69 l)
  end.

Fixpoint v70_size_69 (t : v70_tree_69) : nat :=
  match t with
  | v70_leaf_69 _ => 1
  | v70_node_69 l r => 1 + v70_size_69 l + v70_size_69 r
  end.

Theorem v70_mirror_involutive_69 : forall t : v70_tree_69,
  v70_mirror_69 (v70_mirror_69 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_69 : forall n : nat,
  v70_mirror_69 (v70_leaf_69 n) = v70_leaf_69 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_069.

