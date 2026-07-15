Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_042.
Inductive v66_tree_42 : Type :=
| v66_leaf_42 : nat -> v66_tree_42
| v66_node_42 : v66_tree_42 -> v66_tree_42 -> v66_tree_42.

Fixpoint v66_size_42 (t : v66_tree_42) : nat :=
  match t with
  | v66_leaf_42 _ => 1
  | v66_node_42 l r => 1 + v66_size_42 l + v66_size_42 r
  end.

Fixpoint v66_mirror_42 (t : v66_tree_42) : v66_tree_42 :=
  match t with
  | v66_leaf_42 n => v66_leaf_42 n
  | v66_node_42 l r => v66_node_42 (v66_mirror_42 r) (v66_mirror_42 l)
  end.

Theorem v66_mirror_involutive_42 : forall t : v66_tree_42,
  v66_mirror_42 (v66_mirror_42 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_42 : forall t : v66_tree_42,
  v66_size_42 (v66_mirror_42 t) = v66_size_42 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_042.

