Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_054.
Inductive v66_tree_54 : Type :=
| v66_leaf_54 : nat -> v66_tree_54
| v66_node_54 : v66_tree_54 -> v66_tree_54 -> v66_tree_54.

Fixpoint v66_size_54 (t : v66_tree_54) : nat :=
  match t with
  | v66_leaf_54 _ => 1
  | v66_node_54 l r => 1 + v66_size_54 l + v66_size_54 r
  end.

Fixpoint v66_mirror_54 (t : v66_tree_54) : v66_tree_54 :=
  match t with
  | v66_leaf_54 n => v66_leaf_54 n
  | v66_node_54 l r => v66_node_54 (v66_mirror_54 r) (v66_mirror_54 l)
  end.

Theorem v66_mirror_involutive_54 : forall t : v66_tree_54,
  v66_mirror_54 (v66_mirror_54 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_54 : forall t : v66_tree_54,
  v66_size_54 (v66_mirror_54 t) = v66_size_54 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_054.

