Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_029.
Inductive v66_tree_29 : Type :=
| v66_leaf_29 : nat -> v66_tree_29
| v66_node_29 : v66_tree_29 -> v66_tree_29 -> v66_tree_29.

Fixpoint v66_size_29 (t : v66_tree_29) : nat :=
  match t with
  | v66_leaf_29 _ => 1
  | v66_node_29 l r => 1 + v66_size_29 l + v66_size_29 r
  end.

Fixpoint v66_mirror_29 (t : v66_tree_29) : v66_tree_29 :=
  match t with
  | v66_leaf_29 n => v66_leaf_29 n
  | v66_node_29 l r => v66_node_29 (v66_mirror_29 r) (v66_mirror_29 l)
  end.

Theorem v66_mirror_involutive_29 : forall t : v66_tree_29,
  v66_mirror_29 (v66_mirror_29 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_29 : forall t : v66_tree_29,
  v66_size_29 (v66_mirror_29 t) = v66_size_29 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_029.

