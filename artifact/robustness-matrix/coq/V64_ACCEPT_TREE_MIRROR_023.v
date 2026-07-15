(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_023.
Require Import Coq.Arith.PeanoNat.
Inductive tree_203 := leaf_203 : nat -> tree_203 | node_203 : tree_203 -> tree_203 -> tree_203.
Fixpoint mirror_203 (t : tree_203) : tree_203 := match t with leaf_203 n => leaf_203 n | node_203 l r => node_203 (mirror_203 r) (mirror_203 l) end.
Fixpoint size_203 (t : tree_203) : nat := match t with leaf_203 _ => 1 | node_203 l r => S (size_203 l + size_203 r) end.
Theorem mirror_involutive_203 : forall t, mirror_203 (mirror_203 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_203 : forall t, size_203 (mirror_203 t) = size_203 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_023.

