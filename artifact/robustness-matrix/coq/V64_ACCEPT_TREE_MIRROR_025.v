(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_025.
Require Import Coq.Arith.PeanoNat.
Inductive tree_205 := leaf_205 : nat -> tree_205 | node_205 : tree_205 -> tree_205 -> tree_205.
Fixpoint mirror_205 (t : tree_205) : tree_205 := match t with leaf_205 n => leaf_205 n | node_205 l r => node_205 (mirror_205 r) (mirror_205 l) end.
Fixpoint size_205 (t : tree_205) : nat := match t with leaf_205 _ => 1 | node_205 l r => S (size_205 l + size_205 r) end.
Theorem mirror_involutive_205 : forall t, mirror_205 (mirror_205 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_205 : forall t, size_205 (mirror_205 t) = size_205 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_025.

