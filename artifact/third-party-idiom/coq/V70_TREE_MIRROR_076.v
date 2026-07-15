Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_076.
Inductive v70_tree_76 : Type :=
| v70_leaf_76 : nat -> v70_tree_76
| v70_node_76 : v70_tree_76 -> v70_tree_76 -> v70_tree_76.

Fixpoint v70_mirror_76 (t : v70_tree_76) : v70_tree_76 :=
  match t with
  | v70_leaf_76 n => v70_leaf_76 n
  | v70_node_76 l r => v70_node_76 (v70_mirror_76 r) (v70_mirror_76 l)
  end.

Fixpoint v70_size_76 (t : v70_tree_76) : nat :=
  match t with
  | v70_leaf_76 _ => 1
  | v70_node_76 l r => 1 + v70_size_76 l + v70_size_76 r
  end.

Theorem v70_mirror_involutive_76 : forall t : v70_tree_76,
  v70_mirror_76 (v70_mirror_76 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_76 : forall n : nat,
  v70_mirror_76 (v70_leaf_76 n) = v70_leaf_76 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_076.

