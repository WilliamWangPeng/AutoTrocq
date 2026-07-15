(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_030.
Require Import Coq.Arith.PeanoNat.
Inductive tree_210 := leaf_210 : nat -> tree_210 | node_210 : tree_210 -> tree_210 -> tree_210.
Fixpoint mirror_210 (t : tree_210) : tree_210 := match t with leaf_210 n => leaf_210 n | node_210 l r => node_210 (mirror_210 r) (mirror_210 l) end.
Fixpoint size_210 (t : tree_210) : nat := match t with leaf_210 _ => 1 | node_210 l r => S (size_210 l + size_210 r) end.
Theorem mirror_involutive_210 : forall t, mirror_210 (mirror_210 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_210 : forall t, size_210 (mirror_210 t) = size_210 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_030.

