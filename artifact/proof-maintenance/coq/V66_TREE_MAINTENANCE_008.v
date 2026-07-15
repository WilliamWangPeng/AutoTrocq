Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_008.
Inductive v66_tree_8 : Type :=
| v66_leaf_8 : nat -> v66_tree_8
| v66_node_8 : v66_tree_8 -> v66_tree_8 -> v66_tree_8.

Fixpoint v66_size_8 (t : v66_tree_8) : nat :=
  match t with
  | v66_leaf_8 _ => 1
  | v66_node_8 l r => 1 + v66_size_8 l + v66_size_8 r
  end.

Fixpoint v66_mirror_8 (t : v66_tree_8) : v66_tree_8 :=
  match t with
  | v66_leaf_8 n => v66_leaf_8 n
  | v66_node_8 l r => v66_node_8 (v66_mirror_8 r) (v66_mirror_8 l)
  end.

Theorem v66_mirror_involutive_8 : forall t : v66_tree_8,
  v66_mirror_8 (v66_mirror_8 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_8 : forall t : v66_tree_8,
  v66_size_8 (v66_mirror_8 t) = v66_size_8 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_008.

