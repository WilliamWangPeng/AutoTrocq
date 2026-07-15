Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_027.
Inductive v70_tree_27 : Type :=
| v70_leaf_27 : nat -> v70_tree_27
| v70_node_27 : v70_tree_27 -> v70_tree_27 -> v70_tree_27.

Fixpoint v70_mirror_27 (t : v70_tree_27) : v70_tree_27 :=
  match t with
  | v70_leaf_27 n => v70_leaf_27 n
  | v70_node_27 l r => v70_node_27 (v70_mirror_27 r) (v70_mirror_27 l)
  end.

Fixpoint v70_size_27 (t : v70_tree_27) : nat :=
  match t with
  | v70_leaf_27 _ => 1
  | v70_node_27 l r => 1 + v70_size_27 l + v70_size_27 r
  end.

Theorem v70_mirror_involutive_27 : forall t : v70_tree_27,
  v70_mirror_27 (v70_mirror_27 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_27 : forall n : nat,
  v70_mirror_27 (v70_leaf_27 n) = v70_leaf_27 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_027.

