Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_032.
Inductive v66_tree_32 : Type :=
| v66_leaf_32 : nat -> v66_tree_32
| v66_node_32 : v66_tree_32 -> v66_tree_32 -> v66_tree_32.

Fixpoint v66_size_32 (t : v66_tree_32) : nat :=
  match t with
  | v66_leaf_32 _ => 1
  | v66_node_32 l r => 1 + v66_size_32 l + v66_size_32 r
  end.

Fixpoint v66_mirror_32 (t : v66_tree_32) : v66_tree_32 :=
  match t with
  | v66_leaf_32 n => v66_leaf_32 n
  | v66_node_32 l r => v66_node_32 (v66_mirror_32 r) (v66_mirror_32 l)
  end.

Theorem v66_mirror_involutive_32 : forall t : v66_tree_32,
  v66_mirror_32 (v66_mirror_32 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_32 : forall t : v66_tree_32,
  v66_size_32 (v66_mirror_32 t) = v66_size_32 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_032.

