Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_025.
Inductive v66_tree_25 : Type :=
| v66_leaf_25 : nat -> v66_tree_25
| v66_node_25 : v66_tree_25 -> v66_tree_25 -> v66_tree_25.

Fixpoint v66_size_25 (t : v66_tree_25) : nat :=
  match t with
  | v66_leaf_25 _ => 1
  | v66_node_25 l r => 1 + v66_size_25 l + v66_size_25 r
  end.

Fixpoint v66_mirror_25 (t : v66_tree_25) : v66_tree_25 :=
  match t with
  | v66_leaf_25 n => v66_leaf_25 n
  | v66_node_25 l r => v66_node_25 (v66_mirror_25 r) (v66_mirror_25 l)
  end.

Theorem v66_mirror_involutive_25 : forall t : v66_tree_25,
  v66_mirror_25 (v66_mirror_25 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_25 : forall t : v66_tree_25,
  v66_size_25 (v66_mirror_25 t) = v66_size_25 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_025.

