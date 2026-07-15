(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_022.
Require Import Coq.Arith.PeanoNat.
Inductive tree_202 := leaf_202 : nat -> tree_202 | node_202 : tree_202 -> tree_202 -> tree_202.
Fixpoint mirror_202 (t : tree_202) : tree_202 := match t with leaf_202 n => leaf_202 n | node_202 l r => node_202 (mirror_202 r) (mirror_202 l) end.
Fixpoint size_202 (t : tree_202) : nat := match t with leaf_202 _ => 1 | node_202 l r => S (size_202 l + size_202 r) end.
Theorem mirror_involutive_202 : forall t, mirror_202 (mirror_202 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_202 : forall t, size_202 (mirror_202 t) = size_202 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_022.

