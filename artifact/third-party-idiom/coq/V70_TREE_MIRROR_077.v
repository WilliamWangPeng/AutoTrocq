Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_TREE_MIRROR_077.
Inductive v70_tree_77 : Type :=
| v70_leaf_77 : nat -> v70_tree_77
| v70_node_77 : v70_tree_77 -> v70_tree_77 -> v70_tree_77.

Fixpoint v70_mirror_77 (t : v70_tree_77) : v70_tree_77 :=
  match t with
  | v70_leaf_77 n => v70_leaf_77 n
  | v70_node_77 l r => v70_node_77 (v70_mirror_77 r) (v70_mirror_77 l)
  end.

Fixpoint v70_size_77 (t : v70_tree_77) : nat :=
  match t with
  | v70_leaf_77 _ => 1
  | v70_node_77 l r => 1 + v70_size_77 l + v70_size_77 r
  end.

Theorem v70_mirror_involutive_77 : forall t : v70_tree_77,
  v70_mirror_77 (v70_mirror_77 t) = t.
Proof.
  induction t; simpl; auto.
  now rewrite IHt1, IHt2.
Qed.

Theorem v70_mirror_leaf_77 : forall n : nat,
  v70_mirror_77 (v70_leaf_77 n) = v70_leaf_77 n.
Proof.
  reflexivity.
Qed.
End V70_TREE_MIRROR_077.

