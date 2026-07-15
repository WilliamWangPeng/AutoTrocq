Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_015.
Inductive v66_tree_15 : Type :=
| v66_leaf_15 : nat -> v66_tree_15
| v66_node_15 : v66_tree_15 -> v66_tree_15 -> v66_tree_15.

Fixpoint v66_size_15 (t : v66_tree_15) : nat :=
  match t with
  | v66_leaf_15 _ => 1
  | v66_node_15 l r => 1 + v66_size_15 l + v66_size_15 r
  end.

Fixpoint v66_mirror_15 (t : v66_tree_15) : v66_tree_15 :=
  match t with
  | v66_leaf_15 n => v66_leaf_15 n
  | v66_node_15 l r => v66_node_15 (v66_mirror_15 r) (v66_mirror_15 l)
  end.

Theorem v66_mirror_involutive_15 : forall t : v66_tree_15,
  v66_mirror_15 (v66_mirror_15 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_15 : forall t : v66_tree_15,
  v66_size_15 (v66_mirror_15 t) = v66_size_15 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_015.

