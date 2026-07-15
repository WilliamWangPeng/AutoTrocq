Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_057.
Inductive v70_tree_57 : Type :=
| v70_leaf_57 : nat -> v70_tree_57
| v70_node_57 : v70_tree_57 -> v70_tree_57 -> v70_tree_57.

Fixpoint v70_mirror_57 (t : v70_tree_57) : v70_tree_57 :=
  match t with
  | v70_leaf_57 n => v70_leaf_57 n
  | v70_node_57 l r => v70_node_57 (v70_mirror_57 r) (v70_mirror_57 l)
  end.

Fixpoint v70_size_57 (t : v70_tree_57) : nat :=
  match t with
  | v70_leaf_57 _ => 1
  | v70_node_57 l r => 1 + v70_size_57 l + v70_size_57 r
  end.

Theorem v70_mirror_involutive_57 : forall t : v70_tree_57,
  v70_mirror_57 (v70_mirror_57 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_57 : forall n : nat,
  v70_mirror_57 (v70_leaf_57 n) = v70_leaf_57 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_057.

