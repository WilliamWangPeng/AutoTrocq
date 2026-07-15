(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_044.
Require Import Coq.Arith.PeanoNat.
Inductive tree_224 := leaf_224 : nat -> tree_224 | node_224 : tree_224 -> tree_224 -> tree_224.
Fixpoint mirror_224 (t : tree_224) : tree_224 := match t with leaf_224 n => leaf_224 n | node_224 l r => node_224 (mirror_224 r) (mirror_224 l) end.
Fixpoint size_224 (t : tree_224) : nat := match t with leaf_224 _ => 1 | node_224 l r => S (size_224 l + size_224 r) end.
Theorem mirror_involutive_224 : forall t, mirror_224 (mirror_224 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_224 : forall t, size_224 (mirror_224 t) = size_224 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_044.

