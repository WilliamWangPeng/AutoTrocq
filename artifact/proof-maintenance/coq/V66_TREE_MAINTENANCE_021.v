Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_021.
Inductive v66_tree_21 : Type :=
| v66_leaf_21 : nat -> v66_tree_21
| v66_node_21 : v66_tree_21 -> v66_tree_21 -> v66_tree_21.

Fixpoint v66_size_21 (t : v66_tree_21) : nat :=
  match t with
  | v66_leaf_21 _ => 1
  | v66_node_21 l r => 1 + v66_size_21 l + v66_size_21 r
  end.

Fixpoint v66_mirror_21 (t : v66_tree_21) : v66_tree_21 :=
  match t with
  | v66_leaf_21 n => v66_leaf_21 n
  | v66_node_21 l r => v66_node_21 (v66_mirror_21 r) (v66_mirror_21 l)
  end.

Theorem v66_mirror_involutive_21 : forall t : v66_tree_21,
  v66_mirror_21 (v66_mirror_21 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_21 : forall t : v66_tree_21,
  v66_size_21 (v66_mirror_21 t) = v66_size_21 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_021.

