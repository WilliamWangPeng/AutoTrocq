Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_072.
Inductive v70_tree_72 : Type :=
| v70_leaf_72 : nat -> v70_tree_72
| v70_node_72 : v70_tree_72 -> v70_tree_72 -> v70_tree_72.

Fixpoint v70_mirror_72 (t : v70_tree_72) : v70_tree_72 :=
  match t with
  | v70_leaf_72 n => v70_leaf_72 n
  | v70_node_72 l r => v70_node_72 (v70_mirror_72 r) (v70_mirror_72 l)
  end.

Fixpoint v70_size_72 (t : v70_tree_72) : nat :=
  match t with
  | v70_leaf_72 _ => 1
  | v70_node_72 l r => 1 + v70_size_72 l + v70_size_72 r
  end.

Theorem v70_mirror_involutive_72 : forall t : v70_tree_72,
  v70_mirror_72 (v70_mirror_72 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_72 : forall n : nat,
  v70_mirror_72 (v70_leaf_72 n) = v70_leaf_72 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_072.

