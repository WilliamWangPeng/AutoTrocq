Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_055.
Inductive v70_tree_55 : Type :=
| v70_leaf_55 : nat -> v70_tree_55
| v70_node_55 : v70_tree_55 -> v70_tree_55 -> v70_tree_55.

Fixpoint v70_mirror_55 (t : v70_tree_55) : v70_tree_55 :=
  match t with
  | v70_leaf_55 n => v70_leaf_55 n
  | v70_node_55 l r => v70_node_55 (v70_mirror_55 r) (v70_mirror_55 l)
  end.

Fixpoint v70_size_55 (t : v70_tree_55) : nat :=
  match t with
  | v70_leaf_55 _ => 1
  | v70_node_55 l r => 1 + v70_size_55 l + v70_size_55 r
  end.

Theorem v70_mirror_involutive_55 : forall t : v70_tree_55,
  v70_mirror_55 (v70_mirror_55 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_55 : forall n : nat,
  v70_mirror_55 (v70_leaf_55 n) = v70_leaf_55 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_055.

