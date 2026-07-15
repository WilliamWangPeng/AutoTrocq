Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_009.
Inductive v66_tree_9 : Type :=
| v66_leaf_9 : nat -> v66_tree_9
| v66_node_9 : v66_tree_9 -> v66_tree_9 -> v66_tree_9.

Fixpoint v66_size_9 (t : v66_tree_9) : nat :=
  match t with
  | v66_leaf_9 _ => 1
  | v66_node_9 l r => 1 + v66_size_9 l + v66_size_9 r
  end.

Fixpoint v66_mirror_9 (t : v66_tree_9) : v66_tree_9 :=
  match t with
  | v66_leaf_9 n => v66_leaf_9 n
  | v66_node_9 l r => v66_node_9 (v66_mirror_9 r) (v66_mirror_9 l)
  end.

Theorem v66_mirror_involutive_9 : forall t : v66_tree_9,
  v66_mirror_9 (v66_mirror_9 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_9 : forall t : v66_tree_9,
  v66_size_9 (v66_mirror_9 t) = v66_size_9 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_009.

