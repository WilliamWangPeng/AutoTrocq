Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_027.
Inductive v66_tree_27 : Type :=
| v66_leaf_27 : nat -> v66_tree_27
| v66_node_27 : v66_tree_27 -> v66_tree_27 -> v66_tree_27.

Fixpoint v66_size_27 (t : v66_tree_27) : nat :=
  match t with
  | v66_leaf_27 _ => 1
  | v66_node_27 l r => 1 + v66_size_27 l + v66_size_27 r
  end.

Fixpoint v66_mirror_27 (t : v66_tree_27) : v66_tree_27 :=
  match t with
  | v66_leaf_27 n => v66_leaf_27 n
  | v66_node_27 l r => v66_node_27 (v66_mirror_27 r) (v66_mirror_27 l)
  end.

Theorem v66_mirror_involutive_27 : forall t : v66_tree_27,
  v66_mirror_27 (v66_mirror_27 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_27 : forall t : v66_tree_27,
  v66_size_27 (v66_mirror_27 t) = v66_size_27 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_027.

