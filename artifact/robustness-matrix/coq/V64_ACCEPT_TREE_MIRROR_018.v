(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_018.
Require Import Coq.Arith.PeanoNat.
Inductive tree_198 := leaf_198 : nat -> tree_198 | node_198 : tree_198 -> tree_198 -> tree_198.
Fixpoint mirror_198 (t : tree_198) : tree_198 := match t with leaf_198 n => leaf_198 n | node_198 l r => node_198 (mirror_198 r) (mirror_198 l) end.
Fixpoint size_198 (t : tree_198) : nat := match t with leaf_198 _ => 1 | node_198 l r => S (size_198 l + size_198 r) end.
Theorem mirror_involutive_198 : forall t, mirror_198 (mirror_198 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_198 : forall t, size_198 (mirror_198 t) = size_198 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_018.

