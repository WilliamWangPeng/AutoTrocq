Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_011.
Inductive v66_tree_11 : Type :=
| v66_leaf_11 : nat -> v66_tree_11
| v66_node_11 : v66_tree_11 -> v66_tree_11 -> v66_tree_11.

Fixpoint v66_size_11 (t : v66_tree_11) : nat :=
  match t with
  | v66_leaf_11 _ => 1
  | v66_node_11 l r => 1 + v66_size_11 l + v66_size_11 r
  end.

Fixpoint v66_mirror_11 (t : v66_tree_11) : v66_tree_11 :=
  match t with
  | v66_leaf_11 n => v66_leaf_11 n
  | v66_node_11 l r => v66_node_11 (v66_mirror_11 r) (v66_mirror_11 l)
  end.

Theorem v66_mirror_involutive_11 : forall t : v66_tree_11,
  v66_mirror_11 (v66_mirror_11 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_11 : forall t : v66_tree_11,
  v66_size_11 (v66_mirror_11 t) = v66_size_11 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_011.

