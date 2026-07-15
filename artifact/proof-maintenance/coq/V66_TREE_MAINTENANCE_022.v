Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_022.
Inductive v66_tree_22 : Type :=
| v66_leaf_22 : nat -> v66_tree_22
| v66_node_22 : v66_tree_22 -> v66_tree_22 -> v66_tree_22.

Fixpoint v66_size_22 (t : v66_tree_22) : nat :=
  match t with
  | v66_leaf_22 _ => 1
  | v66_node_22 l r => 1 + v66_size_22 l + v66_size_22 r
  end.

Fixpoint v66_mirror_22 (t : v66_tree_22) : v66_tree_22 :=
  match t with
  | v66_leaf_22 n => v66_leaf_22 n
  | v66_node_22 l r => v66_node_22 (v66_mirror_22 r) (v66_mirror_22 l)
  end.

Theorem v66_mirror_involutive_22 : forall t : v66_tree_22,
  v66_mirror_22 (v66_mirror_22 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_22 : forall t : v66_tree_22,
  v66_size_22 (v66_mirror_22 t) = v66_size_22 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_022.

