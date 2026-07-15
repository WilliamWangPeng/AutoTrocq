(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_014.
Require Import Coq.Arith.PeanoNat.
Inductive tree_194 := leaf_194 : nat -> tree_194 | node_194 : tree_194 -> tree_194 -> tree_194.
Fixpoint mirror_194 (t : tree_194) : tree_194 := match t with leaf_194 n => leaf_194 n | node_194 l r => node_194 (mirror_194 r) (mirror_194 l) end.
Fixpoint size_194 (t : tree_194) : nat := match t with leaf_194 _ => 1 | node_194 l r => S (size_194 l + size_194 r) end.
Theorem mirror_involutive_194 : forall t, mirror_194 (mirror_194 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_194 : forall t, size_194 (mirror_194 t) = size_194 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_014.

