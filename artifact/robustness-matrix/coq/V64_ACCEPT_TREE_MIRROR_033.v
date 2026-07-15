(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_033.
Require Import Coq.Arith.PeanoNat.
Inductive tree_213 := leaf_213 : nat -> tree_213 | node_213 : tree_213 -> tree_213 -> tree_213.
Fixpoint mirror_213 (t : tree_213) : tree_213 := match t with leaf_213 n => leaf_213 n | node_213 l r => node_213 (mirror_213 r) (mirror_213 l) end.
Fixpoint size_213 (t : tree_213) : nat := match t with leaf_213 _ => 1 | node_213 l r => S (size_213 l + size_213 r) end.
Theorem mirror_involutive_213 : forall t, mirror_213 (mirror_213 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_213 : forall t, size_213 (mirror_213 t) = size_213 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_033.

