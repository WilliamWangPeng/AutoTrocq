(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_048.
Require Import Coq.Arith.PeanoNat.
Inductive tree_228 := leaf_228 : nat -> tree_228 | node_228 : tree_228 -> tree_228 -> tree_228.
Fixpoint mirror_228 (t : tree_228) : tree_228 := match t with leaf_228 n => leaf_228 n | node_228 l r => node_228 (mirror_228 r) (mirror_228 l) end.
Fixpoint size_228 (t : tree_228) : nat := match t with leaf_228 _ => 1 | node_228 l r => S (size_228 l + size_228 r) end.
Theorem mirror_involutive_228 : forall t, mirror_228 (mirror_228 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_228 : forall t, size_228 (mirror_228 t) = size_228 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_048.

