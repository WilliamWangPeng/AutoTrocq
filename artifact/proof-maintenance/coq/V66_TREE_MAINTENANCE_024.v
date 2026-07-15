Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_024.
Inductive v66_tree_24 : Type :=
| v66_leaf_24 : nat -> v66_tree_24
| v66_node_24 : v66_tree_24 -> v66_tree_24 -> v66_tree_24.

Fixpoint v66_size_24 (t : v66_tree_24) : nat :=
  match t with
  | v66_leaf_24 _ => 1
  | v66_node_24 l r => 1 + v66_size_24 l + v66_size_24 r
  end.

Fixpoint v66_mirror_24 (t : v66_tree_24) : v66_tree_24 :=
  match t with
  | v66_leaf_24 n => v66_leaf_24 n
  | v66_node_24 l r => v66_node_24 (v66_mirror_24 r) (v66_mirror_24 l)
  end.

Theorem v66_mirror_involutive_24 : forall t : v66_tree_24,
  v66_mirror_24 (v66_mirror_24 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_24 : forall t : v66_tree_24,
  v66_size_24 (v66_mirror_24 t) = v66_size_24 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_024.

