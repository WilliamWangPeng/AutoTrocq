Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_039.
Inductive v70_tree_39 : Type :=
| v70_leaf_39 : nat -> v70_tree_39
| v70_node_39 : v70_tree_39 -> v70_tree_39 -> v70_tree_39.

Fixpoint v70_mirror_39 (t : v70_tree_39) : v70_tree_39 :=
  match t with
  | v70_leaf_39 n => v70_leaf_39 n
  | v70_node_39 l r => v70_node_39 (v70_mirror_39 r) (v70_mirror_39 l)
  end.

Fixpoint v70_size_39 (t : v70_tree_39) : nat :=
  match t with
  | v70_leaf_39 _ => 1
  | v70_node_39 l r => 1 + v70_size_39 l + v70_size_39 r
  end.

Theorem v70_mirror_involutive_39 : forall t : v70_tree_39,
  v70_mirror_39 (v70_mirror_39 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_39 : forall n : nat,
  v70_mirror_39 (v70_leaf_39 n) = v70_leaf_39 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_039.

