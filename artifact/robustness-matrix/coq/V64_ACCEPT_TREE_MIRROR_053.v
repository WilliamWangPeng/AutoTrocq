(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_053.
Require Import Coq.Arith.PeanoNat.
Inductive tree_233 := leaf_233 : nat -> tree_233 | node_233 : tree_233 -> tree_233 -> tree_233.
Fixpoint mirror_233 (t : tree_233) : tree_233 := match t with leaf_233 n => leaf_233 n | node_233 l r => node_233 (mirror_233 r) (mirror_233 l) end.
Fixpoint size_233 (t : tree_233) : nat := match t with leaf_233 _ => 1 | node_233 l r => S (size_233 l + size_233 r) end.
Theorem mirror_involutive_233 : forall t, mirror_233 (mirror_233 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_233 : forall t, size_233 (mirror_233 t) = size_233 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_053.

