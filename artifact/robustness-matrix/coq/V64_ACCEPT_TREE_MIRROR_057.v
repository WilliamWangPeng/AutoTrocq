(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_057.
Require Import Coq.Arith.PeanoNat.
Inductive tree_237 := leaf_237 : nat -> tree_237 | node_237 : tree_237 -> tree_237 -> tree_237.
Fixpoint mirror_237 (t : tree_237) : tree_237 := match t with leaf_237 n => leaf_237 n | node_237 l r => node_237 (mirror_237 r) (mirror_237 l) end.
Fixpoint size_237 (t : tree_237) : nat := match t with leaf_237 _ => 1 | node_237 l r => S (size_237 l + size_237 r) end.
Theorem mirror_involutive_237 : forall t, mirror_237 (mirror_237 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_237 : forall t, size_237 (mirror_237 t) = size_237 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_057.

