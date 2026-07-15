Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_044.
Inductive v66_tree_44 : Type :=
| v66_leaf_44 : nat -> v66_tree_44
| v66_node_44 : v66_tree_44 -> v66_tree_44 -> v66_tree_44.

Fixpoint v66_size_44 (t : v66_tree_44) : nat :=
  match t with
  | v66_leaf_44 _ => 1
  | v66_node_44 l r => 1 + v66_size_44 l + v66_size_44 r
  end.

Fixpoint v66_mirror_44 (t : v66_tree_44) : v66_tree_44 :=
  match t with
  | v66_leaf_44 n => v66_leaf_44 n
  | v66_node_44 l r => v66_node_44 (v66_mirror_44 r) (v66_mirror_44 l)
  end.

Theorem v66_mirror_involutive_44 : forall t : v66_tree_44,
  v66_mirror_44 (v66_mirror_44 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_44 : forall t : v66_tree_44,
  v66_size_44 (v66_mirror_44 t) = v66_size_44 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_044.

