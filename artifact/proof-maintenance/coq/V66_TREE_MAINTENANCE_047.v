Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_047.
Inductive v66_tree_47 : Type :=
| v66_leaf_47 : nat -> v66_tree_47
| v66_node_47 : v66_tree_47 -> v66_tree_47 -> v66_tree_47.

Fixpoint v66_size_47 (t : v66_tree_47) : nat :=
  match t with
  | v66_leaf_47 _ => 1
  | v66_node_47 l r => 1 + v66_size_47 l + v66_size_47 r
  end.

Fixpoint v66_mirror_47 (t : v66_tree_47) : v66_tree_47 :=
  match t with
  | v66_leaf_47 n => v66_leaf_47 n
  | v66_node_47 l r => v66_node_47 (v66_mirror_47 r) (v66_mirror_47 l)
  end.

Theorem v66_mirror_involutive_47 : forall t : v66_tree_47,
  v66_mirror_47 (v66_mirror_47 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_47 : forall t : v66_tree_47,
  v66_size_47 (v66_mirror_47 t) = v66_size_47 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_047.

