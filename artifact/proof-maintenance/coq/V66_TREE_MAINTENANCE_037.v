Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_037.
Inductive v66_tree_37 : Type :=
| v66_leaf_37 : nat -> v66_tree_37
| v66_node_37 : v66_tree_37 -> v66_tree_37 -> v66_tree_37.

Fixpoint v66_size_37 (t : v66_tree_37) : nat :=
  match t with
  | v66_leaf_37 _ => 1
  | v66_node_37 l r => 1 + v66_size_37 l + v66_size_37 r
  end.

Fixpoint v66_mirror_37 (t : v66_tree_37) : v66_tree_37 :=
  match t with
  | v66_leaf_37 n => v66_leaf_37 n
  | v66_node_37 l r => v66_node_37 (v66_mirror_37 r) (v66_mirror_37 l)
  end.

Theorem v66_mirror_involutive_37 : forall t : v66_tree_37,
  v66_mirror_37 (v66_mirror_37 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_37 : forall t : v66_tree_37,
  v66_size_37 (v66_mirror_37 t) = v66_size_37 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_037.

