Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_002.
Inductive v66_tree_2 : Type :=
| v66_leaf_2 : nat -> v66_tree_2
| v66_node_2 : v66_tree_2 -> v66_tree_2 -> v66_tree_2.

Fixpoint v66_size_2 (t : v66_tree_2) : nat :=
  match t with
  | v66_leaf_2 _ => 1
  | v66_node_2 l r => 1 + v66_size_2 l + v66_size_2 r
  end.

Fixpoint v66_mirror_2 (t : v66_tree_2) : v66_tree_2 :=
  match t with
  | v66_leaf_2 n => v66_leaf_2 n
  | v66_node_2 l r => v66_node_2 (v66_mirror_2 r) (v66_mirror_2 l)
  end.

Theorem v66_mirror_involutive_2 : forall t : v66_tree_2,
  v66_mirror_2 (v66_mirror_2 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_2 : forall t : v66_tree_2,
  v66_size_2 (v66_mirror_2 t) = v66_size_2 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_002.

