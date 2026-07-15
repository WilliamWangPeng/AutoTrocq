(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_055.
Require Import Coq.Arith.PeanoNat.
Inductive tree_235 := leaf_235 : nat -> tree_235 | node_235 : tree_235 -> tree_235 -> tree_235.
Fixpoint mirror_235 (t : tree_235) : tree_235 := match t with leaf_235 n => leaf_235 n | node_235 l r => node_235 (mirror_235 r) (mirror_235 l) end.
Fixpoint size_235 (t : tree_235) : nat := match t with leaf_235 _ => 1 | node_235 l r => S (size_235 l + size_235 r) end.
Theorem mirror_involutive_235 : forall t, mirror_235 (mirror_235 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_235 : forall t, size_235 (mirror_235 t) = size_235 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_055.

