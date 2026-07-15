(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_017.
Require Import Coq.Arith.PeanoNat.
Inductive tree_197 := leaf_197 : nat -> tree_197 | node_197 : tree_197 -> tree_197 -> tree_197.
Fixpoint mirror_197 (t : tree_197) : tree_197 := match t with leaf_197 n => leaf_197 n | node_197 l r => node_197 (mirror_197 r) (mirror_197 l) end.
Fixpoint size_197 (t : tree_197) : nat := match t with leaf_197 _ => 1 | node_197 l r => S (size_197 l + size_197 r) end.
Theorem mirror_involutive_197 : forall t, mirror_197 (mirror_197 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_197 : forall t, size_197 (mirror_197 t) = size_197 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_017.

