(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_050.
Require Import Coq.Arith.PeanoNat.
Inductive tree_230 := leaf_230 : nat -> tree_230 | node_230 : tree_230 -> tree_230 -> tree_230.
Fixpoint mirror_230 (t : tree_230) : tree_230 := match t with leaf_230 n => leaf_230 n | node_230 l r => node_230 (mirror_230 r) (mirror_230 l) end.
Fixpoint size_230 (t : tree_230) : nat := match t with leaf_230 _ => 1 | node_230 l r => S (size_230 l + size_230 r) end.
Theorem mirror_involutive_230 : forall t, mirror_230 (mirror_230 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_230 : forall t, size_230 (mirror_230 t) = size_230 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_050.

