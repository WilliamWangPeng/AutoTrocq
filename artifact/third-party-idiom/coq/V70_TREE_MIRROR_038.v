Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_038.
Inductive v70_tree_38 : Type :=
| v70_leaf_38 : nat -> v70_tree_38
| v70_node_38 : v70_tree_38 -> v70_tree_38 -> v70_tree_38.

Fixpoint v70_mirror_38 (t : v70_tree_38) : v70_tree_38 :=
  match t with
  | v70_leaf_38 n => v70_leaf_38 n
  | v70_node_38 l r => v70_node_38 (v70_mirror_38 r) (v70_mirror_38 l)
  end.

Fixpoint v70_size_38 (t : v70_tree_38) : nat :=
  match t with
  | v70_leaf_38 _ => 1
  | v70_node_38 l r => 1 + v70_size_38 l + v70_size_38 r
  end.

Theorem v70_mirror_involutive_38 : forall t : v70_tree_38,
  v70_mirror_38 (v70_mirror_38 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_38 : forall n : nat,
  v70_mirror_38 (v70_leaf_38 n) = v70_leaf_38 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_038.

