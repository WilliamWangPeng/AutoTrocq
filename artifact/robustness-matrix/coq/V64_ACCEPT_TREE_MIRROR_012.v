(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_012.
Require Import Coq.Arith.PeanoNat.
Inductive tree_192 := leaf_192 : nat -> tree_192 | node_192 : tree_192 -> tree_192 -> tree_192.
Fixpoint mirror_192 (t : tree_192) : tree_192 := match t with leaf_192 n => leaf_192 n | node_192 l r => node_192 (mirror_192 r) (mirror_192 l) end.
Fixpoint size_192 (t : tree_192) : nat := match t with leaf_192 _ => 1 | node_192 l r => S (size_192 l + size_192 r) end.
Theorem mirror_involutive_192 : forall t, mirror_192 (mirror_192 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_192 : forall t, size_192 (mirror_192 t) = size_192 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_012.

