Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_048.
Inductive v66_tree_48 : Type :=
| v66_leaf_48 : nat -> v66_tree_48
| v66_node_48 : v66_tree_48 -> v66_tree_48 -> v66_tree_48.

Fixpoint v66_size_48 (t : v66_tree_48) : nat :=
  match t with
  | v66_leaf_48 _ => 1
  | v66_node_48 l r => 1 + v66_size_48 l + v66_size_48 r
  end.

Fixpoint v66_mirror_48 (t : v66_tree_48) : v66_tree_48 :=
  match t with
  | v66_leaf_48 n => v66_leaf_48 n
  | v66_node_48 l r => v66_node_48 (v66_mirror_48 r) (v66_mirror_48 l)
  end.

Theorem v66_mirror_involutive_48 : forall t : v66_tree_48,
  v66_mirror_48 (v66_mirror_48 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_48 : forall t : v66_tree_48,
  v66_size_48 (v66_mirror_48 t) = v66_size_48 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_048.

