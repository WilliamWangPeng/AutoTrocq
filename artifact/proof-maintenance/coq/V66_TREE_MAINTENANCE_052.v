Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_052.
Inductive v66_tree_52 : Type :=
| v66_leaf_52 : nat -> v66_tree_52
| v66_node_52 : v66_tree_52 -> v66_tree_52 -> v66_tree_52.

Fixpoint v66_size_52 (t : v66_tree_52) : nat :=
  match t with
  | v66_leaf_52 _ => 1
  | v66_node_52 l r => 1 + v66_size_52 l + v66_size_52 r
  end.

Fixpoint v66_mirror_52 (t : v66_tree_52) : v66_tree_52 :=
  match t with
  | v66_leaf_52 n => v66_leaf_52 n
  | v66_node_52 l r => v66_node_52 (v66_mirror_52 r) (v66_mirror_52 l)
  end.

Theorem v66_mirror_involutive_52 : forall t : v66_tree_52,
  v66_mirror_52 (v66_mirror_52 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_52 : forall t : v66_tree_52,
  v66_size_52 (v66_mirror_52 t) = v66_size_52 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_052.

