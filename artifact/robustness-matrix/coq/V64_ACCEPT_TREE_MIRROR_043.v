(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_043.
Require Import Coq.Arith.PeanoNat.
Inductive tree_223 := leaf_223 : nat -> tree_223 | node_223 : tree_223 -> tree_223 -> tree_223.
Fixpoint mirror_223 (t : tree_223) : tree_223 := match t with leaf_223 n => leaf_223 n | node_223 l r => node_223 (mirror_223 r) (mirror_223 l) end.
Fixpoint size_223 (t : tree_223) : nat := match t with leaf_223 _ => 1 | node_223 l r => S (size_223 l + size_223 r) end.
Theorem mirror_involutive_223 : forall t, mirror_223 (mirror_223 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_223 : forall t, size_223 (mirror_223 t) = size_223 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_043.

