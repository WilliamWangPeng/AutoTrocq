(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_031.
Require Import Coq.Arith.PeanoNat.
Inductive tree_211 := leaf_211 : nat -> tree_211 | node_211 : tree_211 -> tree_211 -> tree_211.
Fixpoint mirror_211 (t : tree_211) : tree_211 := match t with leaf_211 n => leaf_211 n | node_211 l r => node_211 (mirror_211 r) (mirror_211 l) end.
Fixpoint size_211 (t : tree_211) : nat := match t with leaf_211 _ => 1 | node_211 l r => S (size_211 l + size_211 r) end.
Theorem mirror_involutive_211 : forall t, mirror_211 (mirror_211 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_211 : forall t, size_211 (mirror_211 t) = size_211 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_031.

