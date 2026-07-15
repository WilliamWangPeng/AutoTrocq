(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_009.
Require Import Coq.Arith.PeanoNat.
Inductive tree_189 := leaf_189 : nat -> tree_189 | node_189 : tree_189 -> tree_189 -> tree_189.
Fixpoint mirror_189 (t : tree_189) : tree_189 := match t with leaf_189 n => leaf_189 n | node_189 l r => node_189 (mirror_189 r) (mirror_189 l) end.
Fixpoint size_189 (t : tree_189) : nat := match t with leaf_189 _ => 1 | node_189 l r => S (size_189 l + size_189 r) end.
Theorem mirror_involutive_189 : forall t, mirror_189 (mirror_189 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_189 : forall t, size_189 (mirror_189 t) = size_189 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_009.

