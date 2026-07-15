Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_033.
Inductive v66_tree_33 : Type :=
| v66_leaf_33 : nat -> v66_tree_33
| v66_node_33 : v66_tree_33 -> v66_tree_33 -> v66_tree_33.

Fixpoint v66_size_33 (t : v66_tree_33) : nat :=
  match t with
  | v66_leaf_33 _ => 1
  | v66_node_33 l r => 1 + v66_size_33 l + v66_size_33 r
  end.

Fixpoint v66_mirror_33 (t : v66_tree_33) : v66_tree_33 :=
  match t with
  | v66_leaf_33 n => v66_leaf_33 n
  | v66_node_33 l r => v66_node_33 (v66_mirror_33 r) (v66_mirror_33 l)
  end.

Theorem v66_mirror_involutive_33 : forall t : v66_tree_33,
  v66_mirror_33 (v66_mirror_33 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_33 : forall t : v66_tree_33,
  v66_size_33 (v66_mirror_33 t) = v66_size_33 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_033.

