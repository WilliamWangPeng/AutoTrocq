Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_051.
Inductive v66_tree_51 : Type :=
| v66_leaf_51 : nat -> v66_tree_51
| v66_node_51 : v66_tree_51 -> v66_tree_51 -> v66_tree_51.

Fixpoint v66_size_51 (t : v66_tree_51) : nat :=
  match t with
  | v66_leaf_51 _ => 1
  | v66_node_51 l r => 1 + v66_size_51 l + v66_size_51 r
  end.

Fixpoint v66_mirror_51 (t : v66_tree_51) : v66_tree_51 :=
  match t with
  | v66_leaf_51 n => v66_leaf_51 n
  | v66_node_51 l r => v66_node_51 (v66_mirror_51 r) (v66_mirror_51 l)
  end.

Theorem v66_mirror_involutive_51 : forall t : v66_tree_51,
  v66_mirror_51 (v66_mirror_51 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_51 : forall t : v66_tree_51,
  v66_size_51 (v66_mirror_51 t) = v66_size_51 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_051.

