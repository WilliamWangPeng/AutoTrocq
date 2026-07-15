Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_054.
Inductive v70_tree_54 : Type :=
| v70_leaf_54 : nat -> v70_tree_54
| v70_node_54 : v70_tree_54 -> v70_tree_54 -> v70_tree_54.

Fixpoint v70_mirror_54 (t : v70_tree_54) : v70_tree_54 :=
  match t with
  | v70_leaf_54 n => v70_leaf_54 n
  | v70_node_54 l r => v70_node_54 (v70_mirror_54 r) (v70_mirror_54 l)
  end.

Fixpoint v70_size_54 (t : v70_tree_54) : nat :=
  match t with
  | v70_leaf_54 _ => 1
  | v70_node_54 l r => 1 + v70_size_54 l + v70_size_54 r
  end.

Theorem v70_mirror_involutive_54 : forall t : v70_tree_54,
  v70_mirror_54 (v70_mirror_54 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_54 : forall n : nat,
  v70_mirror_54 (v70_leaf_54 n) = v70_leaf_54 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_054.

