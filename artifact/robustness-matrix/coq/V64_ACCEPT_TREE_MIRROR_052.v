(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_052.
Require Import Coq.Arith.PeanoNat.
Inductive tree_232 := leaf_232 : nat -> tree_232 | node_232 : tree_232 -> tree_232 -> tree_232.
Fixpoint mirror_232 (t : tree_232) : tree_232 := match t with leaf_232 n => leaf_232 n | node_232 l r => node_232 (mirror_232 r) (mirror_232 l) end.
Fixpoint size_232 (t : tree_232) : nat := match t with leaf_232 _ => 1 | node_232 l r => S (size_232 l + size_232 r) end.
Theorem mirror_involutive_232 : forall t, mirror_232 (mirror_232 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_232 : forall t, size_232 (mirror_232 t) = size_232 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_052.

