Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_013.
Inductive v66_tree_13 : Type :=
| v66_leaf_13 : nat -> v66_tree_13
| v66_node_13 : v66_tree_13 -> v66_tree_13 -> v66_tree_13.

Fixpoint v66_size_13 (t : v66_tree_13) : nat :=
  match t with
  | v66_leaf_13 _ => 1
  | v66_node_13 l r => 1 + v66_size_13 l + v66_size_13 r
  end.

Fixpoint v66_mirror_13 (t : v66_tree_13) : v66_tree_13 :=
  match t with
  | v66_leaf_13 n => v66_leaf_13 n
  | v66_node_13 l r => v66_node_13 (v66_mirror_13 r) (v66_mirror_13 l)
  end.

Theorem v66_mirror_involutive_13 : forall t : v66_tree_13,
  v66_mirror_13 (v66_mirror_13 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_13 : forall t : v66_tree_13,
  v66_size_13 (v66_mirror_13 t) = v66_size_13 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_013.

