Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_052.
Inductive v70_tree_52 : Type :=
| v70_leaf_52 : nat -> v70_tree_52
| v70_node_52 : v70_tree_52 -> v70_tree_52 -> v70_tree_52.

Fixpoint v70_mirror_52 (t : v70_tree_52) : v70_tree_52 :=
  match t with
  | v70_leaf_52 n => v70_leaf_52 n
  | v70_node_52 l r => v70_node_52 (v70_mirror_52 r) (v70_mirror_52 l)
  end.

Fixpoint v70_size_52 (t : v70_tree_52) : nat :=
  match t with
  | v70_leaf_52 _ => 1
  | v70_node_52 l r => 1 + v70_size_52 l + v70_size_52 r
  end.

Theorem v70_mirror_involutive_52 : forall t : v70_tree_52,
  v70_mirror_52 (v70_mirror_52 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_52 : forall n : nat,
  v70_mirror_52 (v70_leaf_52 n) = v70_leaf_52 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_052.

