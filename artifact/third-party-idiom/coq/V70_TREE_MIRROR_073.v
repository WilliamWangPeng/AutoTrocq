Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_073.
Inductive v70_tree_73 : Type :=
| v70_leaf_73 : nat -> v70_tree_73
| v70_node_73 : v70_tree_73 -> v70_tree_73 -> v70_tree_73.

Fixpoint v70_mirror_73 (t : v70_tree_73) : v70_tree_73 :=
  match t with
  | v70_leaf_73 n => v70_leaf_73 n
  | v70_node_73 l r => v70_node_73 (v70_mirror_73 r) (v70_mirror_73 l)
  end.

Fixpoint v70_size_73 (t : v70_tree_73) : nat :=
  match t with
  | v70_leaf_73 _ => 1
  | v70_node_73 l r => 1 + v70_size_73 l + v70_size_73 r
  end.

Theorem v70_mirror_involutive_73 : forall t : v70_tree_73,
  v70_mirror_73 (v70_mirror_73 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_73 : forall n : nat,
  v70_mirror_73 (v70_leaf_73 n) = v70_leaf_73 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_073.

