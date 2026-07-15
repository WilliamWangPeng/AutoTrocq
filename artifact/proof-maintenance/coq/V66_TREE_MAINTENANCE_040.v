Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_040.
Inductive v66_tree_40 : Type :=
| v66_leaf_40 : nat -> v66_tree_40
| v66_node_40 : v66_tree_40 -> v66_tree_40 -> v66_tree_40.

Fixpoint v66_size_40 (t : v66_tree_40) : nat :=
  match t with
  | v66_leaf_40 _ => 1
  | v66_node_40 l r => 1 + v66_size_40 l + v66_size_40 r
  end.

Fixpoint v66_mirror_40 (t : v66_tree_40) : v66_tree_40 :=
  match t with
  | v66_leaf_40 n => v66_leaf_40 n
  | v66_node_40 l r => v66_node_40 (v66_mirror_40 r) (v66_mirror_40 l)
  end.

Theorem v66_mirror_involutive_40 : forall t : v66_tree_40,
  v66_mirror_40 (v66_mirror_40 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_40 : forall t : v66_tree_40,
  v66_size_40 (v66_mirror_40 t) = v66_size_40 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_040.

