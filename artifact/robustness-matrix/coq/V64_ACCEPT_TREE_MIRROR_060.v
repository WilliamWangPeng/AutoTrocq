(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_060.
Require Import Coq.Arith.PeanoNat.
Inductive tree_240 := leaf_240 : nat -> tree_240 | node_240 : tree_240 -> tree_240 -> tree_240.
Fixpoint mirror_240 (t : tree_240) : tree_240 := match t with leaf_240 n => leaf_240 n | node_240 l r => node_240 (mirror_240 r) (mirror_240 l) end.
Fixpoint size_240 (t : tree_240) : nat := match t with leaf_240 _ => 1 | node_240 l r => S (size_240 l + size_240 r) end.
Theorem mirror_involutive_240 : forall t, mirror_240 (mirror_240 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_240 : forall t, size_240 (mirror_240 t) = size_240 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_060.

