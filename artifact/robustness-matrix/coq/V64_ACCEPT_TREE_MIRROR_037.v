(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_037.
Require Import Coq.Arith.PeanoNat.
Inductive tree_217 := leaf_217 : nat -> tree_217 | node_217 : tree_217 -> tree_217 -> tree_217.
Fixpoint mirror_217 (t : tree_217) : tree_217 := match t with leaf_217 n => leaf_217 n | node_217 l r => node_217 (mirror_217 r) (mirror_217 l) end.
Fixpoint size_217 (t : tree_217) : nat := match t with leaf_217 _ => 1 | node_217 l r => S (size_217 l + size_217 r) end.
Theorem mirror_involutive_217 : forall t, mirror_217 (mirror_217 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_217 : forall t, size_217 (mirror_217 t) = size_217 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_037.

