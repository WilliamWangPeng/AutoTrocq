(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_005.
Require Import Coq.Arith.PeanoNat.
Inductive tree_185 := leaf_185 : nat -> tree_185 | node_185 : tree_185 -> tree_185 -> tree_185.
Fixpoint mirror_185 (t : tree_185) : tree_185 := match t with leaf_185 n => leaf_185 n | node_185 l r => node_185 (mirror_185 r) (mirror_185 l) end.
Fixpoint size_185 (t : tree_185) : nat := match t with leaf_185 _ => 1 | node_185 l r => S (size_185 l + size_185 r) end.
Theorem mirror_involutive_185 : forall t, mirror_185 (mirror_185 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_185 : forall t, size_185 (mirror_185 t) = size_185 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_005.

