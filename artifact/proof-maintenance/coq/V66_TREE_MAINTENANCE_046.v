Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_046.
Inductive v66_tree_46 : Type :=
| v66_leaf_46 : nat -> v66_tree_46
| v66_node_46 : v66_tree_46 -> v66_tree_46 -> v66_tree_46.

Fixpoint v66_size_46 (t : v66_tree_46) : nat :=
  match t with
  | v66_leaf_46 _ => 1
  | v66_node_46 l r => 1 + v66_size_46 l + v66_size_46 r
  end.

Fixpoint v66_mirror_46 (t : v66_tree_46) : v66_tree_46 :=
  match t with
  | v66_leaf_46 n => v66_leaf_46 n
  | v66_node_46 l r => v66_node_46 (v66_mirror_46 r) (v66_mirror_46 l)
  end.

Theorem v66_mirror_involutive_46 : forall t : v66_tree_46,
  v66_mirror_46 (v66_mirror_46 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_46 : forall t : v66_tree_46,
  v66_size_46 (v66_mirror_46 t) = v66_size_46 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_046.

