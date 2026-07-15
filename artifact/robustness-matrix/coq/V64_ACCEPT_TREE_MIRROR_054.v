(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_054.
Require Import Coq.Arith.PeanoNat.
Inductive tree_234 := leaf_234 : nat -> tree_234 | node_234 : tree_234 -> tree_234 -> tree_234.
Fixpoint mirror_234 (t : tree_234) : tree_234 := match t with leaf_234 n => leaf_234 n | node_234 l r => node_234 (mirror_234 r) (mirror_234 l) end.
Fixpoint size_234 (t : tree_234) : nat := match t with leaf_234 _ => 1 | node_234 l r => S (size_234 l + size_234 r) end.
Theorem mirror_involutive_234 : forall t, mirror_234 (mirror_234 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_234 : forall t, size_234 (mirror_234 t) = size_234 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_054.

