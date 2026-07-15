Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_001.
Inductive v66_tree_1 : Type :=
| v66_leaf_1 : nat -> v66_tree_1
| v66_node_1 : v66_tree_1 -> v66_tree_1 -> v66_tree_1.

Fixpoint v66_size_1 (t : v66_tree_1) : nat :=
  match t with
  | v66_leaf_1 _ => 1
  | v66_node_1 l r => 1 + v66_size_1 l + v66_size_1 r
  end.

Fixpoint v66_mirror_1 (t : v66_tree_1) : v66_tree_1 :=
  match t with
  | v66_leaf_1 n => v66_leaf_1 n
  | v66_node_1 l r => v66_node_1 (v66_mirror_1 r) (v66_mirror_1 l)
  end.

Theorem v66_mirror_involutive_1 : forall t : v66_tree_1,
  v66_mirror_1 (v66_mirror_1 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_1 : forall t : v66_tree_1,
  v66_size_1 (v66_mirror_1 t) = v66_size_1 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_001.

