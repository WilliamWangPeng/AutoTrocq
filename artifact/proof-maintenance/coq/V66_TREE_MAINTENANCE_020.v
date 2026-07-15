Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_020.
Inductive v66_tree_20 : Type :=
| v66_leaf_20 : nat -> v66_tree_20
| v66_node_20 : v66_tree_20 -> v66_tree_20 -> v66_tree_20.

Fixpoint v66_size_20 (t : v66_tree_20) : nat :=
  match t with
  | v66_leaf_20 _ => 1
  | v66_node_20 l r => 1 + v66_size_20 l + v66_size_20 r
  end.

Fixpoint v66_mirror_20 (t : v66_tree_20) : v66_tree_20 :=
  match t with
  | v66_leaf_20 n => v66_leaf_20 n
  | v66_node_20 l r => v66_node_20 (v66_mirror_20 r) (v66_mirror_20 l)
  end.

Theorem v66_mirror_involutive_20 : forall t : v66_tree_20,
  v66_mirror_20 (v66_mirror_20 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_20 : forall t : v66_tree_20,
  v66_size_20 (v66_mirror_20 t) = v66_size_20 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_020.

