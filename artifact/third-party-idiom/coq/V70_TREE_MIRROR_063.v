Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_063.
Inductive v70_tree_63 : Type :=
| v70_leaf_63 : nat -> v70_tree_63
| v70_node_63 : v70_tree_63 -> v70_tree_63 -> v70_tree_63.

Fixpoint v70_mirror_63 (t : v70_tree_63) : v70_tree_63 :=
  match t with
  | v70_leaf_63 n => v70_leaf_63 n
  | v70_node_63 l r => v70_node_63 (v70_mirror_63 r) (v70_mirror_63 l)
  end.

Fixpoint v70_size_63 (t : v70_tree_63) : nat :=
  match t with
  | v70_leaf_63 _ => 1
  | v70_node_63 l r => 1 + v70_size_63 l + v70_size_63 r
  end.

Theorem v70_mirror_involutive_63 : forall t : v70_tree_63,
  v70_mirror_63 (v70_mirror_63 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_63 : forall n : nat,
  v70_mirror_63 (v70_leaf_63 n) = v70_leaf_63 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_063.

