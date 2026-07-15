Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_TREE_MAINTENANCE_038.
Inductive v66_tree_38 : Type :=
| v66_leaf_38 : nat -> v66_tree_38
| v66_node_38 : v66_tree_38 -> v66_tree_38 -> v66_tree_38.

Fixpoint v66_size_38 (t : v66_tree_38) : nat :=
  match t with
  | v66_leaf_38 _ => 1
  | v66_node_38 l r => 1 + v66_size_38 l + v66_size_38 r
  end.

Fixpoint v66_mirror_38 (t : v66_tree_38) : v66_tree_38 :=
  match t with
  | v66_leaf_38 n => v66_leaf_38 n
  | v66_node_38 l r => v66_node_38 (v66_mirror_38 r) (v66_mirror_38 l)
  end.

Theorem v66_mirror_involutive_38 : forall t : v66_tree_38,
  v66_mirror_38 (v66_mirror_38 t) = t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. reflexivity.
Qed.

Theorem v66_mirror_size_38 : forall t : v66_tree_38,
  v66_size_38 (v66_mirror_38 t) = v66_size_38 t.
Proof.
  induction t; simpl; auto.
  rewrite IHt1, IHt2. rewrite Nat.add_comm. reflexivity.
Qed.
End V66_TREE_MAINTENANCE_038.

