(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_019.
Require Import Coq.Arith.PeanoNat.
Inductive tree_199 := leaf_199 : nat -> tree_199 | node_199 : tree_199 -> tree_199 -> tree_199.
Fixpoint mirror_199 (t : tree_199) : tree_199 := match t with leaf_199 n => leaf_199 n | node_199 l r => node_199 (mirror_199 r) (mirror_199 l) end.
Fixpoint size_199 (t : tree_199) : nat := match t with leaf_199 _ => 1 | node_199 l r => S (size_199 l + size_199 r) end.
Theorem mirror_involutive_199 : forall t, mirror_199 (mirror_199 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_199 : forall t, size_199 (mirror_199 t) = size_199 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_019.

