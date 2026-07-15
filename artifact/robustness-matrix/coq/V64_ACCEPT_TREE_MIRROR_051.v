(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_051.
Require Import Coq.Arith.PeanoNat.
Inductive tree_231 := leaf_231 : nat -> tree_231 | node_231 : tree_231 -> tree_231 -> tree_231.
Fixpoint mirror_231 (t : tree_231) : tree_231 := match t with leaf_231 n => leaf_231 n | node_231 l r => node_231 (mirror_231 r) (mirror_231 l) end.
Fixpoint size_231 (t : tree_231) : nat := match t with leaf_231 _ => 1 | node_231 l r => S (size_231 l + size_231 r) end.
Theorem mirror_involutive_231 : forall t, mirror_231 (mirror_231 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_231 : forall t, size_231 (mirror_231 t) = size_231 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_051.

