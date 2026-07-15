Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_033.
Inductive v70_tree_33 : Type :=
| v70_leaf_33 : nat -> v70_tree_33
| v70_node_33 : v70_tree_33 -> v70_tree_33 -> v70_tree_33.

Fixpoint v70_mirror_33 (t : v70_tree_33) : v70_tree_33 :=
  match t with
  | v70_leaf_33 n => v70_leaf_33 n
  | v70_node_33 l r => v70_node_33 (v70_mirror_33 r) (v70_mirror_33 l)
  end.

Fixpoint v70_size_33 (t : v70_tree_33) : nat :=
  match t with
  | v70_leaf_33 _ => 1
  | v70_node_33 l r => 1 + v70_size_33 l + v70_size_33 r
  end.

Theorem v70_mirror_involutive_33 : forall t : v70_tree_33,
  v70_mirror_33 (v70_mirror_33 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_33 : forall n : nat,
  v70_mirror_33 (v70_leaf_33 n) = v70_leaf_33 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_033.

