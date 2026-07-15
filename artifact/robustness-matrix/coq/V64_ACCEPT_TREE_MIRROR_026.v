(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_026.
Require Import Coq.Arith.PeanoNat.
Inductive tree_206 := leaf_206 : nat -> tree_206 | node_206 : tree_206 -> tree_206 -> tree_206.
Fixpoint mirror_206 (t : tree_206) : tree_206 := match t with leaf_206 n => leaf_206 n | node_206 l r => node_206 (mirror_206 r) (mirror_206 l) end.
Fixpoint size_206 (t : tree_206) : nat := match t with leaf_206 _ => 1 | node_206 l r => S (size_206 l + size_206 r) end.
Theorem mirror_involutive_206 : forall t, mirror_206 (mirror_206 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_206 : forall t, size_206 (mirror_206 t) = size_206 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_026.

