Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_058.
Inductive v66_tree_58 : Type :=
| v66_leaf_58 : nat -> v66_tree_58
| v66_node_58 : v66_tree_58 -> v66_tree_58 -> v66_tree_58.

Fixpoint v66_size_58 (t : v66_tree_58) : nat :=
  match t with
  | v66_leaf_58 _ => 1
  | v66_node_58 l r => 1 + v66_size_58 l + v66_size_58 r
  end.

Fixpoint v66_mirror_58 (t : v66_tree_58) : v66_tree_58 :=
  match t with
  | v66_leaf_58 n => v66_leaf_58 n
  | v66_node_58 l r => v66_node_58 (v66_mirror_58 r) (v66_mirror_58 l)
  end.

Theorem v66_mirror_involutive_58 : forall t : v66_tree_58,
  v66_mirror_58 (v66_mirror_58 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_58 : forall t : v66_tree_58,
  v66_size_58 (v66_mirror_58 t) = v66_size_58 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_058.

