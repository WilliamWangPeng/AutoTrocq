Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_034.
Inductive v66_tree_34 : Type :=
| v66_leaf_34 : nat -> v66_tree_34
| v66_node_34 : v66_tree_34 -> v66_tree_34 -> v66_tree_34.

Fixpoint v66_size_34 (t : v66_tree_34) : nat :=
  match t with
  | v66_leaf_34 _ => 1
  | v66_node_34 l r => 1 + v66_size_34 l + v66_size_34 r
  end.

Fixpoint v66_mirror_34 (t : v66_tree_34) : v66_tree_34 :=
  match t with
  | v66_leaf_34 n => v66_leaf_34 n
  | v66_node_34 l r => v66_node_34 (v66_mirror_34 r) (v66_mirror_34 l)
  end.

Theorem v66_mirror_involutive_34 : forall t : v66_tree_34,
  v66_mirror_34 (v66_mirror_34 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_34 : forall t : v66_tree_34,
  v66_size_34 (v66_mirror_34 t) = v66_size_34 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_034.

