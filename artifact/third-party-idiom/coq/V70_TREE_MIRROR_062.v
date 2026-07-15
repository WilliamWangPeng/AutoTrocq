Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_062.
Inductive v70_tree_62 : Type :=
| v70_leaf_62 : nat -> v70_tree_62
| v70_node_62 : v70_tree_62 -> v70_tree_62 -> v70_tree_62.

Fixpoint v70_mirror_62 (t : v70_tree_62) : v70_tree_62 :=
  match t with
  | v70_leaf_62 n => v70_leaf_62 n
  | v70_node_62 l r => v70_node_62 (v70_mirror_62 r) (v70_mirror_62 l)
  end.

Fixpoint v70_size_62 (t : v70_tree_62) : nat :=
  match t with
  | v70_leaf_62 _ => 1
  | v70_node_62 l r => 1 + v70_size_62 l + v70_size_62 r
  end.

Theorem v70_mirror_involutive_62 : forall t : v70_tree_62,
  v70_mirror_62 (v70_mirror_62 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_62 : forall n : nat,
  v70_mirror_62 (v70_leaf_62 n) = v70_leaf_62 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_062.

