(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_058.
Require Import Coq.Arith.PeanoNat.
Inductive tree_238 := leaf_238 : nat -> tree_238 | node_238 : tree_238 -> tree_238 -> tree_238.
Fixpoint mirror_238 (t : tree_238) : tree_238 := match t with leaf_238 n => leaf_238 n | node_238 l r => node_238 (mirror_238 r) (mirror_238 l) end.
Fixpoint size_238 (t : tree_238) : nat := match t with leaf_238 _ => 1 | node_238 l r => S (size_238 l + size_238 r) end.
Theorem mirror_involutive_238 : forall t, mirror_238 (mirror_238 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_238 : forall t, size_238 (mirror_238 t) = size_238 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_058.

