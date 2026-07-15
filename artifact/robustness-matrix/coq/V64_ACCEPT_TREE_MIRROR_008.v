(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_008.
Require Import Coq.Arith.PeanoNat.
Inductive tree_188 := leaf_188 : nat -> tree_188 | node_188 : tree_188 -> tree_188 -> tree_188.
Fixpoint mirror_188 (t : tree_188) : tree_188 := match t with leaf_188 n => leaf_188 n | node_188 l r => node_188 (mirror_188 r) (mirror_188 l) end.
Fixpoint size_188 (t : tree_188) : nat := match t with leaf_188 _ => 1 | node_188 l r => S (size_188 l + size_188 r) end.
Theorem mirror_involutive_188 : forall t, mirror_188 (mirror_188 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_188 : forall t, size_188 (mirror_188 t) = size_188 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_008.

