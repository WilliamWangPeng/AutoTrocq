Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_041.
Inductive v66_tree_41 : Type :=
| v66_leaf_41 : nat -> v66_tree_41
| v66_node_41 : v66_tree_41 -> v66_tree_41 -> v66_tree_41.

Fixpoint v66_size_41 (t : v66_tree_41) : nat :=
  match t with
  | v66_leaf_41 _ => 1
  | v66_node_41 l r => 1 + v66_size_41 l + v66_size_41 r
  end.

Fixpoint v66_mirror_41 (t : v66_tree_41) : v66_tree_41 :=
  match t with
  | v66_leaf_41 n => v66_leaf_41 n
  | v66_node_41 l r => v66_node_41 (v66_mirror_41 r) (v66_mirror_41 l)
  end.

Theorem v66_mirror_involutive_41 : forall t : v66_tree_41,
  v66_mirror_41 (v66_mirror_41 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_41 : forall t : v66_tree_41,
  v66_size_41 (v66_mirror_41 t) = v66_size_41 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_041.

