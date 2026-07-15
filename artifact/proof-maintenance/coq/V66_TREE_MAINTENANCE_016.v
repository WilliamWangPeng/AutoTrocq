Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_016.
Inductive v66_tree_16 : Type :=
| v66_leaf_16 : nat -> v66_tree_16
| v66_node_16 : v66_tree_16 -> v66_tree_16 -> v66_tree_16.

Fixpoint v66_size_16 (t : v66_tree_16) : nat :=
  match t with
  | v66_leaf_16 _ => 1
  | v66_node_16 l r => 1 + v66_size_16 l + v66_size_16 r
  end.

Fixpoint v66_mirror_16 (t : v66_tree_16) : v66_tree_16 :=
  match t with
  | v66_leaf_16 n => v66_leaf_16 n
  | v66_node_16 l r => v66_node_16 (v66_mirror_16 r) (v66_mirror_16 l)
  end.

Theorem v66_mirror_involutive_16 : forall t : v66_tree_16,
  v66_mirror_16 (v66_mirror_16 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_16 : forall t : v66_tree_16,
  v66_size_16 (v66_mirror_16 t) = v66_size_16 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_016.

