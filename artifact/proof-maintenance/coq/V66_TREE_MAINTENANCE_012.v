Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_012.
Inductive v66_tree_12 : Type :=
| v66_leaf_12 : nat -> v66_tree_12
| v66_node_12 : v66_tree_12 -> v66_tree_12 -> v66_tree_12.

Fixpoint v66_size_12 (t : v66_tree_12) : nat :=
  match t with
  | v66_leaf_12 _ => 1
  | v66_node_12 l r => 1 + v66_size_12 l + v66_size_12 r
  end.

Fixpoint v66_mirror_12 (t : v66_tree_12) : v66_tree_12 :=
  match t with
  | v66_leaf_12 n => v66_leaf_12 n
  | v66_node_12 l r => v66_node_12 (v66_mirror_12 r) (v66_mirror_12 l)
  end.

Theorem v66_mirror_involutive_12 : forall t : v66_tree_12,
  v66_mirror_12 (v66_mirror_12 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_12 : forall t : v66_tree_12,
  v66_size_12 (v66_mirror_12 t) = v66_size_12 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_012.

