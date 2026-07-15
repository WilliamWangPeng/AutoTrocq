Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_017.
Inductive v66_tree_17 : Type :=
| v66_leaf_17 : nat -> v66_tree_17
| v66_node_17 : v66_tree_17 -> v66_tree_17 -> v66_tree_17.

Fixpoint v66_size_17 (t : v66_tree_17) : nat :=
  match t with
  | v66_leaf_17 _ => 1
  | v66_node_17 l r => 1 + v66_size_17 l + v66_size_17 r
  end.

Fixpoint v66_mirror_17 (t : v66_tree_17) : v66_tree_17 :=
  match t with
  | v66_leaf_17 n => v66_leaf_17 n
  | v66_node_17 l r => v66_node_17 (v66_mirror_17 r) (v66_mirror_17 l)
  end.

Theorem v66_mirror_involutive_17 : forall t : v66_tree_17,
  v66_mirror_17 (v66_mirror_17 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_17 : forall t : v66_tree_17,
  v66_size_17 (v66_mirror_17 t) = v66_size_17 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_017.

