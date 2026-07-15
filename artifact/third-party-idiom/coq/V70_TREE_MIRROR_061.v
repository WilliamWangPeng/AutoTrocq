Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_061.
Inductive v70_tree_61 : Type :=
| v70_leaf_61 : nat -> v70_tree_61
| v70_node_61 : v70_tree_61 -> v70_tree_61 -> v70_tree_61.

Fixpoint v70_mirror_61 (t : v70_tree_61) : v70_tree_61 :=
  match t with
  | v70_leaf_61 n => v70_leaf_61 n
  | v70_node_61 l r => v70_node_61 (v70_mirror_61 r) (v70_mirror_61 l)
  end.

Fixpoint v70_size_61 (t : v70_tree_61) : nat :=
  match t with
  | v70_leaf_61 _ => 1
  | v70_node_61 l r => 1 + v70_size_61 l + v70_size_61 r
  end.

Theorem v70_mirror_involutive_61 : forall t : v70_tree_61,
  v70_mirror_61 (v70_mirror_61 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_61 : forall n : nat,
  v70_mirror_61 (v70_leaf_61 n) = v70_leaf_61 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_061.

