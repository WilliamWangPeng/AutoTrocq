Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_025.
Inductive v70_tree_25 : Type :=
| v70_leaf_25 : nat -> v70_tree_25
| v70_node_25 : v70_tree_25 -> v70_tree_25 -> v70_tree_25.

Fixpoint v70_mirror_25 (t : v70_tree_25) : v70_tree_25 :=
  match t with
  | v70_leaf_25 n => v70_leaf_25 n
  | v70_node_25 l r => v70_node_25 (v70_mirror_25 r) (v70_mirror_25 l)
  end.

Fixpoint v70_size_25 (t : v70_tree_25) : nat :=
  match t with
  | v70_leaf_25 _ => 1
  | v70_node_25 l r => 1 + v70_size_25 l + v70_size_25 r
  end.

Theorem v70_mirror_involutive_25 : forall t : v70_tree_25,
  v70_mirror_25 (v70_mirror_25 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_25 : forall n : nat,
  v70_mirror_25 (v70_leaf_25 n) = v70_leaf_25 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_025.

