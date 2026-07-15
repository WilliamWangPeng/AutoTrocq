(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_056.
Require Import Coq.Arith.PeanoNat.
Inductive tree_236 := leaf_236 : nat -> tree_236 | node_236 : tree_236 -> tree_236 -> tree_236.
Fixpoint mirror_236 (t : tree_236) : tree_236 := match t with leaf_236 n => leaf_236 n | node_236 l r => node_236 (mirror_236 r) (mirror_236 l) end.
Fixpoint size_236 (t : tree_236) : nat := match t with leaf_236 _ => 1 | node_236 l r => S (size_236 l + size_236 r) end.
Theorem mirror_involutive_236 : forall t, mirror_236 (mirror_236 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_236 : forall t, size_236 (mirror_236 t) = size_236 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_056.

