Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_037.
Inductive v70_tree_37 : Type :=
| v70_leaf_37 : nat -> v70_tree_37
| v70_node_37 : v70_tree_37 -> v70_tree_37 -> v70_tree_37.

Fixpoint v70_mirror_37 (t : v70_tree_37) : v70_tree_37 :=
  match t with
  | v70_leaf_37 n => v70_leaf_37 n
  | v70_node_37 l r => v70_node_37 (v70_mirror_37 r) (v70_mirror_37 l)
  end.

Fixpoint v70_size_37 (t : v70_tree_37) : nat :=
  match t with
  | v70_leaf_37 _ => 1
  | v70_node_37 l r => 1 + v70_size_37 l + v70_size_37 r
  end.

Theorem v70_mirror_involutive_37 : forall t : v70_tree_37,
  v70_mirror_37 (v70_mirror_37 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_37 : forall n : nat,
  v70_mirror_37 (v70_leaf_37 n) = v70_leaf_37 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_037.

