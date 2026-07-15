Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_055.
Inductive v66_tree_55 : Type :=
| v66_leaf_55 : nat -> v66_tree_55
| v66_node_55 : v66_tree_55 -> v66_tree_55 -> v66_tree_55.

Fixpoint v66_size_55 (t : v66_tree_55) : nat :=
  match t with
  | v66_leaf_55 _ => 1
  | v66_node_55 l r => 1 + v66_size_55 l + v66_size_55 r
  end.

Fixpoint v66_mirror_55 (t : v66_tree_55) : v66_tree_55 :=
  match t with
  | v66_leaf_55 n => v66_leaf_55 n
  | v66_node_55 l r => v66_node_55 (v66_mirror_55 r) (v66_mirror_55 l)
  end.

Theorem v66_mirror_involutive_55 : forall t : v66_tree_55,
  v66_mirror_55 (v66_mirror_55 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_55 : forall t : v66_tree_55,
  v66_size_55 (v66_mirror_55 t) = v66_size_55 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_055.

