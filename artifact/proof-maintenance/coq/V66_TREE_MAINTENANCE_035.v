Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_035.
Inductive v66_tree_35 : Type :=
| v66_leaf_35 : nat -> v66_tree_35
| v66_node_35 : v66_tree_35 -> v66_tree_35 -> v66_tree_35.

Fixpoint v66_size_35 (t : v66_tree_35) : nat :=
  match t with
  | v66_leaf_35 _ => 1
  | v66_node_35 l r => 1 + v66_size_35 l + v66_size_35 r
  end.

Fixpoint v66_mirror_35 (t : v66_tree_35) : v66_tree_35 :=
  match t with
  | v66_leaf_35 n => v66_leaf_35 n
  | v66_node_35 l r => v66_node_35 (v66_mirror_35 r) (v66_mirror_35 l)
  end.

Theorem v66_mirror_involutive_35 : forall t : v66_tree_35,
  v66_mirror_35 (v66_mirror_35 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_35 : forall t : v66_tree_35,
  v66_size_35 (v66_mirror_35 t) = v66_size_35 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_035.

