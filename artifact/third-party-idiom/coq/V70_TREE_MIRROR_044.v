Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_044.
Inductive v70_tree_44 : Type :=
| v70_leaf_44 : nat -> v70_tree_44
| v70_node_44 : v70_tree_44 -> v70_tree_44 -> v70_tree_44.

Fixpoint v70_mirror_44 (t : v70_tree_44) : v70_tree_44 :=
  match t with
  | v70_leaf_44 n => v70_leaf_44 n
  | v70_node_44 l r => v70_node_44 (v70_mirror_44 r) (v70_mirror_44 l)
  end.

Fixpoint v70_size_44 (t : v70_tree_44) : nat :=
  match t with
  | v70_leaf_44 _ => 1
  | v70_node_44 l r => 1 + v70_size_44 l + v70_size_44 r
  end.

Theorem v70_mirror_involutive_44 : forall t : v70_tree_44,
  v70_mirror_44 (v70_mirror_44 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_44 : forall n : nat,
  v70_mirror_44 (v70_leaf_44 n) = v70_leaf_44 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_044.

