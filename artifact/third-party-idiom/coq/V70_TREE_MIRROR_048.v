Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_048.
Inductive v70_tree_48 : Type :=
| v70_leaf_48 : nat -> v70_tree_48
| v70_node_48 : v70_tree_48 -> v70_tree_48 -> v70_tree_48.

Fixpoint v70_mirror_48 (t : v70_tree_48) : v70_tree_48 :=
  match t with
  | v70_leaf_48 n => v70_leaf_48 n
  | v70_node_48 l r => v70_node_48 (v70_mirror_48 r) (v70_mirror_48 l)
  end.

Fixpoint v70_size_48 (t : v70_tree_48) : nat :=
  match t with
  | v70_leaf_48 _ => 1
  | v70_node_48 l r => 1 + v70_size_48 l + v70_size_48 r
  end.

Theorem v70_mirror_involutive_48 : forall t : v70_tree_48,
  v70_mirror_48 (v70_mirror_48 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_48 : forall n : nat,
  v70_mirror_48 (v70_leaf_48 n) = v70_leaf_48 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_048.

