Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_047.
Inductive v70_tree_47 : Type :=
| v70_leaf_47 : nat -> v70_tree_47
| v70_node_47 : v70_tree_47 -> v70_tree_47 -> v70_tree_47.

Fixpoint v70_mirror_47 (t : v70_tree_47) : v70_tree_47 :=
  match t with
  | v70_leaf_47 n => v70_leaf_47 n
  | v70_node_47 l r => v70_node_47 (v70_mirror_47 r) (v70_mirror_47 l)
  end.

Fixpoint v70_size_47 (t : v70_tree_47) : nat :=
  match t with
  | v70_leaf_47 _ => 1
  | v70_node_47 l r => 1 + v70_size_47 l + v70_size_47 r
  end.

Theorem v70_mirror_involutive_47 : forall t : v70_tree_47,
  v70_mirror_47 (v70_mirror_47 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_47 : forall n : nat,
  v70_mirror_47 (v70_leaf_47 n) = v70_leaf_47 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_047.

