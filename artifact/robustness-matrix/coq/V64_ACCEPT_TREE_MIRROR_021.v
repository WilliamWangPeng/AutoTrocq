(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_021.
Require Import Coq.Arith.PeanoNat.
Inductive tree_201 := leaf_201 : nat -> tree_201 | node_201 : tree_201 -> tree_201 -> tree_201.
Fixpoint mirror_201 (t : tree_201) : tree_201 := match t with leaf_201 n => leaf_201 n | node_201 l r => node_201 (mirror_201 r) (mirror_201 l) end.
Fixpoint size_201 (t : tree_201) : nat := match t with leaf_201 _ => 1 | node_201 l r => S (size_201 l + size_201 r) end.
Theorem mirror_involutive_201 : forall t, mirror_201 (mirror_201 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_201 : forall t, size_201 (mirror_201 t) = size_201 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_021.

