Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_056.
Inductive v66_tree_56 : Type :=
| v66_leaf_56 : nat -> v66_tree_56
| v66_node_56 : v66_tree_56 -> v66_tree_56 -> v66_tree_56.

Fixpoint v66_size_56 (t : v66_tree_56) : nat :=
  match t with
  | v66_leaf_56 _ => 1
  | v66_node_56 l r => 1 + v66_size_56 l + v66_size_56 r
  end.

Fixpoint v66_mirror_56 (t : v66_tree_56) : v66_tree_56 :=
  match t with
  | v66_leaf_56 n => v66_leaf_56 n
  | v66_node_56 l r => v66_node_56 (v66_mirror_56 r) (v66_mirror_56 l)
  end.

Theorem v66_mirror_involutive_56 : forall t : v66_tree_56,
  v66_mirror_56 (v66_mirror_56 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_56 : forall t : v66_tree_56,
  v66_size_56 (v66_mirror_56 t) = v66_size_56 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_056.

