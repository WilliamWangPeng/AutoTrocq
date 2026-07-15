(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_042.
Require Import Coq.Arith.PeanoNat.
Inductive tree_222 := leaf_222 : nat -> tree_222 | node_222 : tree_222 -> tree_222 -> tree_222.
Fixpoint mirror_222 (t : tree_222) : tree_222 := match t with leaf_222 n => leaf_222 n | node_222 l r => node_222 (mirror_222 r) (mirror_222 l) end.
Fixpoint size_222 (t : tree_222) : nat := match t with leaf_222 _ => 1 | node_222 l r => S (size_222 l + size_222 r) end.
Theorem mirror_involutive_222 : forall t, mirror_222 (mirror_222 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_222 : forall t, size_222 (mirror_222 t) = size_222 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_042.

