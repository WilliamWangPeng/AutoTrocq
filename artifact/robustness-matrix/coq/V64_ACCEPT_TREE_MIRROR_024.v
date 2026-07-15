(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_024.
Require Import Coq.Arith.PeanoNat.
Inductive tree_204 := leaf_204 : nat -> tree_204 | node_204 : tree_204 -> tree_204 -> tree_204.
Fixpoint mirror_204 (t : tree_204) : tree_204 := match t with leaf_204 n => leaf_204 n | node_204 l r => node_204 (mirror_204 r) (mirror_204 l) end.
Fixpoint size_204 (t : tree_204) : nat := match t with leaf_204 _ => 1 | node_204 l r => S (size_204 l + size_204 r) end.
Theorem mirror_involutive_204 : forall t, mirror_204 (mirror_204 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_204 : forall t, size_204 (mirror_204 t) = size_204 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_024.

