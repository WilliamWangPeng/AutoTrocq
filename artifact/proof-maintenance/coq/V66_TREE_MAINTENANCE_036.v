Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_036.
Inductive v66_tree_36 : Type :=
| v66_leaf_36 : nat -> v66_tree_36
| v66_node_36 : v66_tree_36 -> v66_tree_36 -> v66_tree_36.

Fixpoint v66_size_36 (t : v66_tree_36) : nat :=
  match t with
  | v66_leaf_36 _ => 1
  | v66_node_36 l r => 1 + v66_size_36 l + v66_size_36 r
  end.

Fixpoint v66_mirror_36 (t : v66_tree_36) : v66_tree_36 :=
  match t with
  | v66_leaf_36 n => v66_leaf_36 n
  | v66_node_36 l r => v66_node_36 (v66_mirror_36 r) (v66_mirror_36 l)
  end.

Theorem v66_mirror_involutive_36 : forall t : v66_tree_36,
  v66_mirror_36 (v66_mirror_36 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_36 : forall t : v66_tree_36,
  v66_size_36 (v66_mirror_36 t) = v66_size_36 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_036.

