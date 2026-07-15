Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_057.
Inductive v66_tree_57 : Type :=
| v66_leaf_57 : nat -> v66_tree_57
| v66_node_57 : v66_tree_57 -> v66_tree_57 -> v66_tree_57.

Fixpoint v66_size_57 (t : v66_tree_57) : nat :=
  match t with
  | v66_leaf_57 _ => 1
  | v66_node_57 l r => 1 + v66_size_57 l + v66_size_57 r
  end.

Fixpoint v66_mirror_57 (t : v66_tree_57) : v66_tree_57 :=
  match t with
  | v66_leaf_57 n => v66_leaf_57 n
  | v66_node_57 l r => v66_node_57 (v66_mirror_57 r) (v66_mirror_57 l)
  end.

Theorem v66_mirror_involutive_57 : forall t : v66_tree_57,
  v66_mirror_57 (v66_mirror_57 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_57 : forall t : v66_tree_57,
  v66_size_57 (v66_mirror_57 t) = v66_size_57 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_057.

