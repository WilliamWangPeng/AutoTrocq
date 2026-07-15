Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_004.
Inductive v66_tree_4 : Type :=
| v66_leaf_4 : nat -> v66_tree_4
| v66_node_4 : v66_tree_4 -> v66_tree_4 -> v66_tree_4.

Fixpoint v66_size_4 (t : v66_tree_4) : nat :=
  match t with
  | v66_leaf_4 _ => 1
  | v66_node_4 l r => 1 + v66_size_4 l + v66_size_4 r
  end.

Fixpoint v66_mirror_4 (t : v66_tree_4) : v66_tree_4 :=
  match t with
  | v66_leaf_4 n => v66_leaf_4 n
  | v66_node_4 l r => v66_node_4 (v66_mirror_4 r) (v66_mirror_4 l)
  end.

Theorem v66_mirror_involutive_4 : forall t : v66_tree_4,
  v66_mirror_4 (v66_mirror_4 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_4 : forall t : v66_tree_4,
  v66_size_4 (v66_mirror_4 t) = v66_size_4 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_004.

