Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_031.
Inductive v66_tree_31 : Type :=
| v66_leaf_31 : nat -> v66_tree_31
| v66_node_31 : v66_tree_31 -> v66_tree_31 -> v66_tree_31.

Fixpoint v66_size_31 (t : v66_tree_31) : nat :=
  match t with
  | v66_leaf_31 _ => 1
  | v66_node_31 l r => 1 + v66_size_31 l + v66_size_31 r
  end.

Fixpoint v66_mirror_31 (t : v66_tree_31) : v66_tree_31 :=
  match t with
  | v66_leaf_31 n => v66_leaf_31 n
  | v66_node_31 l r => v66_node_31 (v66_mirror_31 r) (v66_mirror_31 l)
  end.

Theorem v66_mirror_involutive_31 : forall t : v66_tree_31,
  v66_mirror_31 (v66_mirror_31 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_31 : forall t : v66_tree_31,
  v66_size_31 (v66_mirror_31 t) = v66_size_31 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_031.

