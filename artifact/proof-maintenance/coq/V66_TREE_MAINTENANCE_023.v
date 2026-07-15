Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_023.
Inductive v66_tree_23 : Type :=
| v66_leaf_23 : nat -> v66_tree_23
| v66_node_23 : v66_tree_23 -> v66_tree_23 -> v66_tree_23.

Fixpoint v66_size_23 (t : v66_tree_23) : nat :=
  match t with
  | v66_leaf_23 _ => 1
  | v66_node_23 l r => 1 + v66_size_23 l + v66_size_23 r
  end.

Fixpoint v66_mirror_23 (t : v66_tree_23) : v66_tree_23 :=
  match t with
  | v66_leaf_23 n => v66_leaf_23 n
  | v66_node_23 l r => v66_node_23 (v66_mirror_23 r) (v66_mirror_23 l)
  end.

Theorem v66_mirror_involutive_23 : forall t : v66_tree_23,
  v66_mirror_23 (v66_mirror_23 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_23 : forall t : v66_tree_23,
  v66_size_23 (v66_mirror_23 t) = v66_size_23 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_023.

