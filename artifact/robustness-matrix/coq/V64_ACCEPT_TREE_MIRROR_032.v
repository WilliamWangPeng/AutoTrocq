(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_032.
Require Import Coq.Arith.PeanoNat.
Inductive tree_212 := leaf_212 : nat -> tree_212 | node_212 : tree_212 -> tree_212 -> tree_212.
Fixpoint mirror_212 (t : tree_212) : tree_212 := match t with leaf_212 n => leaf_212 n | node_212 l r => node_212 (mirror_212 r) (mirror_212 l) end.
Fixpoint size_212 (t : tree_212) : nat := match t with leaf_212 _ => 1 | node_212 l r => S (size_212 l + size_212 r) end.
Theorem mirror_involutive_212 : forall t, mirror_212 (mirror_212 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_212 : forall t, size_212 (mirror_212 t) = size_212 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_032.

