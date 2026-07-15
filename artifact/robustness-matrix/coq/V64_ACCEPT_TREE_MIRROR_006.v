(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_006.
Require Import Coq.Arith.PeanoNat.
Inductive tree_186 := leaf_186 : nat -> tree_186 | node_186 : tree_186 -> tree_186 -> tree_186.
Fixpoint mirror_186 (t : tree_186) : tree_186 := match t with leaf_186 n => leaf_186 n | node_186 l r => node_186 (mirror_186 r) (mirror_186 l) end.
Fixpoint size_186 (t : tree_186) : nat := match t with leaf_186 _ => 1 | node_186 l r => S (size_186 l + size_186 r) end.
Theorem mirror_involutive_186 : forall t, mirror_186 (mirror_186 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_186 : forall t, size_186 (mirror_186 t) = size_186 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_006.

