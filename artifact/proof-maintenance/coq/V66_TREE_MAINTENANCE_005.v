Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_005.
Inductive v66_tree_5 : Type :=
| v66_leaf_5 : nat -> v66_tree_5
| v66_node_5 : v66_tree_5 -> v66_tree_5 -> v66_tree_5.

Fixpoint v66_size_5 (t : v66_tree_5) : nat :=
  match t with
  | v66_leaf_5 _ => 1
  | v66_node_5 l r => 1 + v66_size_5 l + v66_size_5 r
  end.

Fixpoint v66_mirror_5 (t : v66_tree_5) : v66_tree_5 :=
  match t with
  | v66_leaf_5 n => v66_leaf_5 n
  | v66_node_5 l r => v66_node_5 (v66_mirror_5 r) (v66_mirror_5 l)
  end.

Theorem v66_mirror_involutive_5 : forall t : v66_tree_5,
  v66_mirror_5 (v66_mirror_5 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_5 : forall t : v66_tree_5,
  v66_size_5 (v66_mirror_5 t) = v66_size_5 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_005.

