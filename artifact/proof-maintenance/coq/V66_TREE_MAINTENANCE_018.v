Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_018.
Inductive v66_tree_18 : Type :=
| v66_leaf_18 : nat -> v66_tree_18
| v66_node_18 : v66_tree_18 -> v66_tree_18 -> v66_tree_18.

Fixpoint v66_size_18 (t : v66_tree_18) : nat :=
  match t with
  | v66_leaf_18 _ => 1
  | v66_node_18 l r => 1 + v66_size_18 l + v66_size_18 r
  end.

Fixpoint v66_mirror_18 (t : v66_tree_18) : v66_tree_18 :=
  match t with
  | v66_leaf_18 n => v66_leaf_18 n
  | v66_node_18 l r => v66_node_18 (v66_mirror_18 r) (v66_mirror_18 l)
  end.

Theorem v66_mirror_involutive_18 : forall t : v66_tree_18,
  v66_mirror_18 (v66_mirror_18 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_18 : forall t : v66_tree_18,
  v66_size_18 (v66_mirror_18 t) = v66_size_18 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_018.

