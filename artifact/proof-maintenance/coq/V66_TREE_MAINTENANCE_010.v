Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_010.
Inductive v66_tree_10 : Type :=
| v66_leaf_10 : nat -> v66_tree_10
| v66_node_10 : v66_tree_10 -> v66_tree_10 -> v66_tree_10.

Fixpoint v66_size_10 (t : v66_tree_10) : nat :=
  match t with
  | v66_leaf_10 _ => 1
  | v66_node_10 l r => 1 + v66_size_10 l + v66_size_10 r
  end.

Fixpoint v66_mirror_10 (t : v66_tree_10) : v66_tree_10 :=
  match t with
  | v66_leaf_10 n => v66_leaf_10 n
  | v66_node_10 l r => v66_node_10 (v66_mirror_10 r) (v66_mirror_10 l)
  end.

Theorem v66_mirror_involutive_10 : forall t : v66_tree_10,
  v66_mirror_10 (v66_mirror_10 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_10 : forall t : v66_tree_10,
  v66_size_10 (v66_mirror_10 t) = v66_size_10 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_010.

