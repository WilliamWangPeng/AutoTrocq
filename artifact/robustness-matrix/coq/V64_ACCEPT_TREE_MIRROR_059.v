(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_059.
Require Import Coq.Arith.PeanoNat.
Inductive tree_239 := leaf_239 : nat -> tree_239 | node_239 : tree_239 -> tree_239 -> tree_239.
Fixpoint mirror_239 (t : tree_239) : tree_239 := match t with leaf_239 n => leaf_239 n | node_239 l r => node_239 (mirror_239 r) (mirror_239 l) end.
Fixpoint size_239 (t : tree_239) : nat := match t with leaf_239 _ => 1 | node_239 l r => S (size_239 l + size_239 r) end.
Theorem mirror_involutive_239 : forall t, mirror_239 (mirror_239 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_239 : forall t, size_239 (mirror_239 t) = size_239 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_059.

