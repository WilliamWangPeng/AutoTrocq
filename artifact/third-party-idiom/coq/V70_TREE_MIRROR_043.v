Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_043.
Inductive v70_tree_43 : Type :=
| v70_leaf_43 : nat -> v70_tree_43
| v70_node_43 : v70_tree_43 -> v70_tree_43 -> v70_tree_43.

Fixpoint v70_mirror_43 (t : v70_tree_43) : v70_tree_43 :=
  match t with
  | v70_leaf_43 n => v70_leaf_43 n
  | v70_node_43 l r => v70_node_43 (v70_mirror_43 r) (v70_mirror_43 l)
  end.

Fixpoint v70_size_43 (t : v70_tree_43) : nat :=
  match t with
  | v70_leaf_43 _ => 1
  | v70_node_43 l r => 1 + v70_size_43 l + v70_size_43 r
  end.

Theorem v70_mirror_involutive_43 : forall t : v70_tree_43,
  v70_mirror_43 (v70_mirror_43 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_43 : forall n : nat,
  v70_mirror_43 (v70_leaf_43 n) = v70_leaf_43 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_043.

