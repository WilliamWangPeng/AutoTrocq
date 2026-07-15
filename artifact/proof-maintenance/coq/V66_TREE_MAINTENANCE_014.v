Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_014.
Inductive v66_tree_14 : Type :=
| v66_leaf_14 : nat -> v66_tree_14
| v66_node_14 : v66_tree_14 -> v66_tree_14 -> v66_tree_14.

Fixpoint v66_size_14 (t : v66_tree_14) : nat :=
  match t with
  | v66_leaf_14 _ => 1
  | v66_node_14 l r => 1 + v66_size_14 l + v66_size_14 r
  end.

Fixpoint v66_mirror_14 (t : v66_tree_14) : v66_tree_14 :=
  match t with
  | v66_leaf_14 n => v66_leaf_14 n
  | v66_node_14 l r => v66_node_14 (v66_mirror_14 r) (v66_mirror_14 l)
  end.

Theorem v66_mirror_involutive_14 : forall t : v66_tree_14,
  v66_mirror_14 (v66_mirror_14 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_14 : forall t : v66_tree_14,
  v66_size_14 (v66_mirror_14 t) = v66_size_14 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_014.

