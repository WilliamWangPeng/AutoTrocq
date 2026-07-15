Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_028.
Inductive v66_tree_28 : Type :=
| v66_leaf_28 : nat -> v66_tree_28
| v66_node_28 : v66_tree_28 -> v66_tree_28 -> v66_tree_28.

Fixpoint v66_size_28 (t : v66_tree_28) : nat :=
  match t with
  | v66_leaf_28 _ => 1
  | v66_node_28 l r => 1 + v66_size_28 l + v66_size_28 r
  end.

Fixpoint v66_mirror_28 (t : v66_tree_28) : v66_tree_28 :=
  match t with
  | v66_leaf_28 n => v66_leaf_28 n
  | v66_node_28 l r => v66_node_28 (v66_mirror_28 r) (v66_mirror_28 l)
  end.

Theorem v66_mirror_involutive_28 : forall t : v66_tree_28,
  v66_mirror_28 (v66_mirror_28 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_28 : forall t : v66_tree_28,
  v66_size_28 (v66_mirror_28 t) = v66_size_28 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_028.

