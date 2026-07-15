Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_053.
Inductive v66_tree_53 : Type :=
| v66_leaf_53 : nat -> v66_tree_53
| v66_node_53 : v66_tree_53 -> v66_tree_53 -> v66_tree_53.

Fixpoint v66_size_53 (t : v66_tree_53) : nat :=
  match t with
  | v66_leaf_53 _ => 1
  | v66_node_53 l r => 1 + v66_size_53 l + v66_size_53 r
  end.

Fixpoint v66_mirror_53 (t : v66_tree_53) : v66_tree_53 :=
  match t with
  | v66_leaf_53 n => v66_leaf_53 n
  | v66_node_53 l r => v66_node_53 (v66_mirror_53 r) (v66_mirror_53 l)
  end.

Theorem v66_mirror_involutive_53 : forall t : v66_tree_53,
  v66_mirror_53 (v66_mirror_53 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_53 : forall t : v66_tree_53,
  v66_size_53 (v66_mirror_53 t) = v66_size_53 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_053.

