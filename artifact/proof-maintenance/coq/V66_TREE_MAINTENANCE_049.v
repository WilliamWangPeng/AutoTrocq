Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_049.
Inductive v66_tree_49 : Type :=
| v66_leaf_49 : nat -> v66_tree_49
| v66_node_49 : v66_tree_49 -> v66_tree_49 -> v66_tree_49.

Fixpoint v66_size_49 (t : v66_tree_49) : nat :=
  match t with
  | v66_leaf_49 _ => 1
  | v66_node_49 l r => 1 + v66_size_49 l + v66_size_49 r
  end.

Fixpoint v66_mirror_49 (t : v66_tree_49) : v66_tree_49 :=
  match t with
  | v66_leaf_49 n => v66_leaf_49 n
  | v66_node_49 l r => v66_node_49 (v66_mirror_49 r) (v66_mirror_49 l)
  end.

Theorem v66_mirror_involutive_49 : forall t : v66_tree_49,
  v66_mirror_49 (v66_mirror_49 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_49 : forall t : v66_tree_49,
  v66_size_49 (v66_mirror_49 t) = v66_size_49 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_049.

