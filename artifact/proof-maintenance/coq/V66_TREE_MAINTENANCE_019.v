Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_019.
Inductive v66_tree_19 : Type :=
| v66_leaf_19 : nat -> v66_tree_19
| v66_node_19 : v66_tree_19 -> v66_tree_19 -> v66_tree_19.

Fixpoint v66_size_19 (t : v66_tree_19) : nat :=
  match t with
  | v66_leaf_19 _ => 1
  | v66_node_19 l r => 1 + v66_size_19 l + v66_size_19 r
  end.

Fixpoint v66_mirror_19 (t : v66_tree_19) : v66_tree_19 :=
  match t with
  | v66_leaf_19 n => v66_leaf_19 n
  | v66_node_19 l r => v66_node_19 (v66_mirror_19 r) (v66_mirror_19 l)
  end.

Theorem v66_mirror_involutive_19 : forall t : v66_tree_19,
  v66_mirror_19 (v66_mirror_19 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_19 : forall t : v66_tree_19,
  v66_size_19 (v66_mirror_19 t) = v66_size_19 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_019.

