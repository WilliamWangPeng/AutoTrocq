(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_045.
Require Import Coq.Arith.PeanoNat.
Inductive tree_225 := leaf_225 : nat -> tree_225 | node_225 : tree_225 -> tree_225 -> tree_225.
Fixpoint mirror_225 (t : tree_225) : tree_225 := match t with leaf_225 n => leaf_225 n | node_225 l r => node_225 (mirror_225 r) (mirror_225 l) end.
Fixpoint size_225 (t : tree_225) : nat := match t with leaf_225 _ => 1 | node_225 l r => S (size_225 l + size_225 r) end.
Theorem mirror_involutive_225 : forall t, mirror_225 (mirror_225 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_225 : forall t, size_225 (mirror_225 t) = size_225 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_045.

