Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_043.
Inductive v66_tree_43 : Type :=
| v66_leaf_43 : nat -> v66_tree_43
| v66_node_43 : v66_tree_43 -> v66_tree_43 -> v66_tree_43.

Fixpoint v66_size_43 (t : v66_tree_43) : nat :=
  match t with
  | v66_leaf_43 _ => 1
  | v66_node_43 l r => 1 + v66_size_43 l + v66_size_43 r
  end.

Fixpoint v66_mirror_43 (t : v66_tree_43) : v66_tree_43 :=
  match t with
  | v66_leaf_43 n => v66_leaf_43 n
  | v66_node_43 l r => v66_node_43 (v66_mirror_43 r) (v66_mirror_43 l)
  end.

Theorem v66_mirror_involutive_43 : forall t : v66_tree_43,
  v66_mirror_43 (v66_mirror_43 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_43 : forall t : v66_tree_43,
  v66_size_43 (v66_mirror_43 t) = v66_size_43 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_043.

