(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_040.
Require Import Coq.Arith.PeanoNat.
Inductive tree_220 := leaf_220 : nat -> tree_220 | node_220 : tree_220 -> tree_220 -> tree_220.
Fixpoint mirror_220 (t : tree_220) : tree_220 := match t with leaf_220 n => leaf_220 n | node_220 l r => node_220 (mirror_220 r) (mirror_220 l) end.
Fixpoint size_220 (t : tree_220) : nat := match t with leaf_220 _ => 1 | node_220 l r => S (size_220 l + size_220 r) end.
Theorem mirror_involutive_220 : forall t, mirror_220 (mirror_220 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_220 : forall t, size_220 (mirror_220 t) = size_220 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_040.

