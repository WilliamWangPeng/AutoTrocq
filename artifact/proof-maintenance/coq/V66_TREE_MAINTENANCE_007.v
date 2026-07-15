Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_007.
Inductive v66_tree_7 : Type :=
| v66_leaf_7 : nat -> v66_tree_7
| v66_node_7 : v66_tree_7 -> v66_tree_7 -> v66_tree_7.

Fixpoint v66_size_7 (t : v66_tree_7) : nat :=
  match t with
  | v66_leaf_7 _ => 1
  | v66_node_7 l r => 1 + v66_size_7 l + v66_size_7 r
  end.

Fixpoint v66_mirror_7 (t : v66_tree_7) : v66_tree_7 :=
  match t with
  | v66_leaf_7 n => v66_leaf_7 n
  | v66_node_7 l r => v66_node_7 (v66_mirror_7 r) (v66_mirror_7 l)
  end.

Theorem v66_mirror_involutive_7 : forall t : v66_tree_7,
  v66_mirror_7 (v66_mirror_7 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_7 : forall t : v66_tree_7,
  v66_size_7 (v66_mirror_7 t) = v66_size_7 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_007.

