Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_045.
Inductive v66_tree_45 : Type :=
| v66_leaf_45 : nat -> v66_tree_45
| v66_node_45 : v66_tree_45 -> v66_tree_45 -> v66_tree_45.

Fixpoint v66_size_45 (t : v66_tree_45) : nat :=
  match t with
  | v66_leaf_45 _ => 1
  | v66_node_45 l r => 1 + v66_size_45 l + v66_size_45 r
  end.

Fixpoint v66_mirror_45 (t : v66_tree_45) : v66_tree_45 :=
  match t with
  | v66_leaf_45 n => v66_leaf_45 n
  | v66_node_45 l r => v66_node_45 (v66_mirror_45 r) (v66_mirror_45 l)
  end.

Theorem v66_mirror_involutive_45 : forall t : v66_tree_45,
  v66_mirror_45 (v66_mirror_45 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_45 : forall t : v66_tree_45,
  v66_size_45 (v66_mirror_45 t) = v66_size_45 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_045.

