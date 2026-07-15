Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_046.
Inductive v70_tree_46 : Type :=
| v70_leaf_46 : nat -> v70_tree_46
| v70_node_46 : v70_tree_46 -> v70_tree_46 -> v70_tree_46.

Fixpoint v70_mirror_46 (t : v70_tree_46) : v70_tree_46 :=
  match t with
  | v70_leaf_46 n => v70_leaf_46 n
  | v70_node_46 l r => v70_node_46 (v70_mirror_46 r) (v70_mirror_46 l)
  end.

Fixpoint v70_size_46 (t : v70_tree_46) : nat :=
  match t with
  | v70_leaf_46 _ => 1
  | v70_node_46 l r => 1 + v70_size_46 l + v70_size_46 r
  end.

Theorem v70_mirror_involutive_46 : forall t : v70_tree_46,
  v70_mirror_46 (v70_mirror_46 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_46 : forall n : nat,
  v70_mirror_46 (v70_leaf_46 n) = v70_leaf_46 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_046.

