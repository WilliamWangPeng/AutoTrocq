Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_006.
Inductive v66_tree_6 : Type :=
| v66_leaf_6 : nat -> v66_tree_6
| v66_node_6 : v66_tree_6 -> v66_tree_6 -> v66_tree_6.

Fixpoint v66_size_6 (t : v66_tree_6) : nat :=
  match t with
  | v66_leaf_6 _ => 1
  | v66_node_6 l r => 1 + v66_size_6 l + v66_size_6 r
  end.

Fixpoint v66_mirror_6 (t : v66_tree_6) : v66_tree_6 :=
  match t with
  | v66_leaf_6 n => v66_leaf_6 n
  | v66_node_6 l r => v66_node_6 (v66_mirror_6 r) (v66_mirror_6 l)
  end.

Theorem v66_mirror_involutive_6 : forall t : v66_tree_6,
  v66_mirror_6 (v66_mirror_6 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_6 : forall t : v66_tree_6,
  v66_size_6 (v66_mirror_6 t) = v66_size_6 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_006.

