(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_010.
Require Import Coq.Arith.PeanoNat.
Inductive tree_190 := leaf_190 : nat -> tree_190 | node_190 : tree_190 -> tree_190 -> tree_190.
Fixpoint mirror_190 (t : tree_190) : tree_190 := match t with leaf_190 n => leaf_190 n | node_190 l r => node_190 (mirror_190 r) (mirror_190 l) end.
Fixpoint size_190 (t : tree_190) : nat := match t with leaf_190 _ => 1 | node_190 l r => S (size_190 l + size_190 r) end.
Theorem mirror_involutive_190 : forall t, mirror_190 (mirror_190 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_190 : forall t, size_190 (mirror_190 t) = size_190 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_010.

