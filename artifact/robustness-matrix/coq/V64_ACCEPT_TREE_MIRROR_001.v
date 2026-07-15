(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_001.
Require Import Coq.Arith.PeanoNat.
Inductive tree_181 := leaf_181 : nat -> tree_181 | node_181 : tree_181 -> tree_181 -> tree_181.
Fixpoint mirror_181 (t : tree_181) : tree_181 := match t with leaf_181 n => leaf_181 n | node_181 l r => node_181 (mirror_181 r) (mirror_181 l) end.
Fixpoint size_181 (t : tree_181) : nat := match t with leaf_181 _ => 1 | node_181 l r => S (size_181 l + size_181 r) end.
Theorem mirror_involutive_181 : forall t, mirror_181 (mirror_181 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_181 : forall t, size_181 (mirror_181 t) = size_181 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_001.

