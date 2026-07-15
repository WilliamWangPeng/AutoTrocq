Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_039.
Inductive v66_tree_39 : Type :=
| v66_leaf_39 : nat -> v66_tree_39
| v66_node_39 : v66_tree_39 -> v66_tree_39 -> v66_tree_39.

Fixpoint v66_size_39 (t : v66_tree_39) : nat :=
  match t with
  | v66_leaf_39 _ => 1
  | v66_node_39 l r => 1 + v66_size_39 l + v66_size_39 r
  end.

Fixpoint v66_mirror_39 (t : v66_tree_39) : v66_tree_39 :=
  match t with
  | v66_leaf_39 n => v66_leaf_39 n
  | v66_node_39 l r => v66_node_39 (v66_mirror_39 r) (v66_mirror_39 l)
  end.

Theorem v66_mirror_involutive_39 : forall t : v66_tree_39,
  v66_mirror_39 (v66_mirror_39 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_39 : forall t : v66_tree_39,
  v66_size_39 (v66_mirror_39 t) = v66_size_39 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_039.

