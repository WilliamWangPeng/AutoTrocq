Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_030.
Inductive v66_tree_30 : Type :=
| v66_leaf_30 : nat -> v66_tree_30
| v66_node_30 : v66_tree_30 -> v66_tree_30 -> v66_tree_30.

Fixpoint v66_size_30 (t : v66_tree_30) : nat :=
  match t with
  | v66_leaf_30 _ => 1
  | v66_node_30 l r => 1 + v66_size_30 l + v66_size_30 r
  end.

Fixpoint v66_mirror_30 (t : v66_tree_30) : v66_tree_30 :=
  match t with
  | v66_leaf_30 n => v66_leaf_30 n
  | v66_node_30 l r => v66_node_30 (v66_mirror_30 r) (v66_mirror_30 l)
  end.

Theorem v66_mirror_involutive_30 : forall t : v66_tree_30,
  v66_mirror_30 (v66_mirror_30 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_30 : forall t : v66_tree_30,
  v66_size_30 (v66_mirror_30 t) = v66_size_30 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_030.

