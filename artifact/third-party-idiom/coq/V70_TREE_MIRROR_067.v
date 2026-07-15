Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_067.
Inductive v70_tree_67 : Type :=
| v70_leaf_67 : nat -> v70_tree_67
| v70_node_67 : v70_tree_67 -> v70_tree_67 -> v70_tree_67.

Fixpoint v70_mirror_67 (t : v70_tree_67) : v70_tree_67 :=
  match t with
  | v70_leaf_67 n => v70_leaf_67 n
  | v70_node_67 l r => v70_node_67 (v70_mirror_67 r) (v70_mirror_67 l)
  end.

Fixpoint v70_size_67 (t : v70_tree_67) : nat :=
  match t with
  | v70_leaf_67 _ => 1
  | v70_node_67 l r => 1 + v70_size_67 l + v70_size_67 r
  end.

Theorem v70_mirror_involutive_67 : forall t : v70_tree_67,
  v70_mirror_67 (v70_mirror_67 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_67 : forall n : nat,
  v70_mirror_67 (v70_leaf_67 n) = v70_leaf_67 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_067.

