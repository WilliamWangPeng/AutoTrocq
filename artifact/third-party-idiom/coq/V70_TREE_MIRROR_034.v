Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_034.
Inductive v70_tree_34 : Type :=
| v70_leaf_34 : nat -> v70_tree_34
| v70_node_34 : v70_tree_34 -> v70_tree_34 -> v70_tree_34.

Fixpoint v70_mirror_34 (t : v70_tree_34) : v70_tree_34 :=
  match t with
  | v70_leaf_34 n => v70_leaf_34 n
  | v70_node_34 l r => v70_node_34 (v70_mirror_34 r) (v70_mirror_34 l)
  end.

Fixpoint v70_size_34 (t : v70_tree_34) : nat :=
  match t with
  | v70_leaf_34 _ => 1
  | v70_node_34 l r => 1 + v70_size_34 l + v70_size_34 r
  end.

Theorem v70_mirror_involutive_34 : forall t : v70_tree_34,
  v70_mirror_34 (v70_mirror_34 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_34 : forall n : nat,
  v70_mirror_34 (v70_leaf_34 n) = v70_leaf_34 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_034.

