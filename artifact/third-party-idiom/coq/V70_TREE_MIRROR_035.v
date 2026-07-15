Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_035.
Inductive v70_tree_35 : Type :=
| v70_leaf_35 : nat -> v70_tree_35
| v70_node_35 : v70_tree_35 -> v70_tree_35 -> v70_tree_35.

Fixpoint v70_mirror_35 (t : v70_tree_35) : v70_tree_35 :=
  match t with
  | v70_leaf_35 n => v70_leaf_35 n
  | v70_node_35 l r => v70_node_35 (v70_mirror_35 r) (v70_mirror_35 l)
  end.

Fixpoint v70_size_35 (t : v70_tree_35) : nat :=
  match t with
  | v70_leaf_35 _ => 1
  | v70_node_35 l r => 1 + v70_size_35 l + v70_size_35 r
  end.

Theorem v70_mirror_involutive_35 : forall t : v70_tree_35,
  v70_mirror_35 (v70_mirror_35 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_35 : forall n : nat,
  v70_mirror_35 (v70_leaf_35 n) = v70_leaf_35 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_035.

