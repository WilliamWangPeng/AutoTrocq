(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_041.
Require Import Coq.Arith.PeanoNat.
Inductive tree_221 := leaf_221 : nat -> tree_221 | node_221 : tree_221 -> tree_221 -> tree_221.
Fixpoint mirror_221 (t : tree_221) : tree_221 := match t with leaf_221 n => leaf_221 n | node_221 l r => node_221 (mirror_221 r) (mirror_221 l) end.
Fixpoint size_221 (t : tree_221) : nat := match t with leaf_221 _ => 1 | node_221 l r => S (size_221 l + size_221 r) end.
Theorem mirror_involutive_221 : forall t, mirror_221 (mirror_221 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_221 : forall t, size_221 (mirror_221 t) = size_221 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_041.

