(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_002.
Require Import Coq.Arith.PeanoNat.
Inductive tree_182 := leaf_182 : nat -> tree_182 | node_182 : tree_182 -> tree_182 -> tree_182.
Fixpoint mirror_182 (t : tree_182) : tree_182 := match t with leaf_182 n => leaf_182 n | node_182 l r => node_182 (mirror_182 r) (mirror_182 l) end.
Fixpoint size_182 (t : tree_182) : nat := match t with leaf_182 _ => 1 | node_182 l r => S (size_182 l + size_182 r) end.
Theorem mirror_involutive_182 : forall t, mirror_182 (mirror_182 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_182 : forall t, size_182 (mirror_182 t) = size_182 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_002.

