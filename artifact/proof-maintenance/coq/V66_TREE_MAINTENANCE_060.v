Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_060.
Inductive v66_tree_60 : Type :=
| v66_leaf_60 : nat -> v66_tree_60
| v66_node_60 : v66_tree_60 -> v66_tree_60 -> v66_tree_60.

Fixpoint v66_size_60 (t : v66_tree_60) : nat :=
  match t with
  | v66_leaf_60 _ => 1
  | v66_node_60 l r => 1 + v66_size_60 l + v66_size_60 r
  end.

Fixpoint v66_mirror_60 (t : v66_tree_60) : v66_tree_60 :=
  match t with
  | v66_leaf_60 n => v66_leaf_60 n
  | v66_node_60 l r => v66_node_60 (v66_mirror_60 r) (v66_mirror_60 l)
  end.

Theorem v66_mirror_involutive_60 : forall t : v66_tree_60,
  v66_mirror_60 (v66_mirror_60 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_60 : forall t : v66_tree_60,
  v66_size_60 (v66_mirror_60 t) = v66_size_60 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_060.

