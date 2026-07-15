(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_007.
Require Import Coq.Arith.PeanoNat.
Inductive tree_187 := leaf_187 : nat -> tree_187 | node_187 : tree_187 -> tree_187 -> tree_187.
Fixpoint mirror_187 (t : tree_187) : tree_187 := match t with leaf_187 n => leaf_187 n | node_187 l r => node_187 (mirror_187 r) (mirror_187 l) end.
Fixpoint size_187 (t : tree_187) : nat := match t with leaf_187 _ => 1 | node_187 l r => S (size_187 l + size_187 r) end.
Theorem mirror_involutive_187 : forall t, mirror_187 (mirror_187 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_187 : forall t, size_187 (mirror_187 t) = size_187 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_007.

