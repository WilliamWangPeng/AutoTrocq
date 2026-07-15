(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_013.
Require Import Coq.Arith.PeanoNat.
Inductive tree_193 := leaf_193 : nat -> tree_193 | node_193 : tree_193 -> tree_193 -> tree_193.
Fixpoint mirror_193 (t : tree_193) : tree_193 := match t with leaf_193 n => leaf_193 n | node_193 l r => node_193 (mirror_193 r) (mirror_193 l) end.
Fixpoint size_193 (t : tree_193) : nat := match t with leaf_193 _ => 1 | node_193 l r => S (size_193 l + size_193 r) end.
Theorem mirror_involutive_193 : forall t, mirror_193 (mirror_193 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_193 : forall t, size_193 (mirror_193 t) = size_193 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_013.

