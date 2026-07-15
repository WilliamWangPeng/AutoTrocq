Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_050.
Inductive v66_tree_50 : Type :=
| v66_leaf_50 : nat -> v66_tree_50
| v66_node_50 : v66_tree_50 -> v66_tree_50 -> v66_tree_50.

Fixpoint v66_size_50 (t : v66_tree_50) : nat :=
  match t with
  | v66_leaf_50 _ => 1
  | v66_node_50 l r => 1 + v66_size_50 l + v66_size_50 r
  end.

Fixpoint v66_mirror_50 (t : v66_tree_50) : v66_tree_50 :=
  match t with
  | v66_leaf_50 n => v66_leaf_50 n
  | v66_node_50 l r => v66_node_50 (v66_mirror_50 r) (v66_mirror_50 l)
  end.

Theorem v66_mirror_involutive_50 : forall t : v66_tree_50,
  v66_mirror_50 (v66_mirror_50 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_50 : forall t : v66_tree_50,
  v66_size_50 (v66_mirror_50 t) = v66_size_50 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_050.

