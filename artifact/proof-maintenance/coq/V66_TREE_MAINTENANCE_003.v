Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_003.
Inductive v66_tree_3 : Type :=
| v66_leaf_3 : nat -> v66_tree_3
| v66_node_3 : v66_tree_3 -> v66_tree_3 -> v66_tree_3.

Fixpoint v66_size_3 (t : v66_tree_3) : nat :=
  match t with
  | v66_leaf_3 _ => 1
  | v66_node_3 l r => 1 + v66_size_3 l + v66_size_3 r
  end.

Fixpoint v66_mirror_3 (t : v66_tree_3) : v66_tree_3 :=
  match t with
  | v66_leaf_3 n => v66_leaf_3 n
  | v66_node_3 l r => v66_node_3 (v66_mirror_3 r) (v66_mirror_3 l)
  end.

Theorem v66_mirror_involutive_3 : forall t : v66_tree_3,
  v66_mirror_3 (v66_mirror_3 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_3 : forall t : v66_tree_3,
  v66_size_3 (v66_mirror_3 t) = v66_size_3 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_003.

