Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_068.
Inductive v70_tree_68 : Type :=
| v70_leaf_68 : nat -> v70_tree_68
| v70_node_68 : v70_tree_68 -> v70_tree_68 -> v70_tree_68.

Fixpoint v70_mirror_68 (t : v70_tree_68) : v70_tree_68 :=
  match t with
  | v70_leaf_68 n => v70_leaf_68 n
  | v70_node_68 l r => v70_node_68 (v70_mirror_68 r) (v70_mirror_68 l)
  end.

Fixpoint v70_size_68 (t : v70_tree_68) : nat :=
  match t with
  | v70_leaf_68 _ => 1
  | v70_node_68 l r => 1 + v70_size_68 l + v70_size_68 r
  end.

Theorem v70_mirror_involutive_68 : forall t : v70_tree_68,
  v70_mirror_68 (v70_mirror_68 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_68 : forall n : nat,
  v70_mirror_68 (v70_leaf_68 n) = v70_leaf_68 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_068.

