Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_026.
Inductive v66_tree_26 : Type :=
| v66_leaf_26 : nat -> v66_tree_26
| v66_node_26 : v66_tree_26 -> v66_tree_26 -> v66_tree_26.

Fixpoint v66_size_26 (t : v66_tree_26) : nat :=
  match t with
  | v66_leaf_26 _ => 1
  | v66_node_26 l r => 1 + v66_size_26 l + v66_size_26 r
  end.

Fixpoint v66_mirror_26 (t : v66_tree_26) : v66_tree_26 :=
  match t with
  | v66_leaf_26 n => v66_leaf_26 n
  | v66_node_26 l r => v66_node_26 (v66_mirror_26 r) (v66_mirror_26 l)
  end.

Theorem v66_mirror_involutive_26 : forall t : v66_tree_26,
  v66_mirror_26 (v66_mirror_26 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_26 : forall t : v66_tree_26,
  v66_size_26 (v66_mirror_26 t) = v66_size_26 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_026.

