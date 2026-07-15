(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_020.
Require Import Coq.Arith.PeanoNat.
Inductive tree_200 := leaf_200 : nat -> tree_200 | node_200 : tree_200 -> tree_200 -> tree_200.
Fixpoint mirror_200 (t : tree_200) : tree_200 := match t with leaf_200 n => leaf_200 n | node_200 l r => node_200 (mirror_200 r) (mirror_200 l) end.
Fixpoint size_200 (t : tree_200) : nat := match t with leaf_200 _ => 1 | node_200 l r => S (size_200 l + size_200 r) end.
Theorem mirror_involutive_200 : forall t, mirror_200 (mirror_200 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_200 : forall t, size_200 (mirror_200 t) = size_200 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_020.

