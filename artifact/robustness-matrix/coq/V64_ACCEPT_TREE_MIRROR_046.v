(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_046.
Require Import Coq.Arith.PeanoNat.
Inductive tree_226 := leaf_226 : nat -> tree_226 | node_226 : tree_226 -> tree_226 -> tree_226.
Fixpoint mirror_226 (t : tree_226) : tree_226 := match t with leaf_226 n => leaf_226 n | node_226 l r => node_226 (mirror_226 r) (mirror_226 l) end.
Fixpoint size_226 (t : tree_226) : nat := match t with leaf_226 _ => 1 | node_226 l r => S (size_226 l + size_226 r) end.
Theorem mirror_involutive_226 : forall t, mirror_226 (mirror_226 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_226 : forall t, size_226 (mirror_226 t) = size_226 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_046.

