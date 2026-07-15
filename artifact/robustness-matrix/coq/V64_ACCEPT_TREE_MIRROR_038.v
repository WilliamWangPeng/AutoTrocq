(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_038.
Require Import Coq.Arith.PeanoNat.
Inductive tree_218 := leaf_218 : nat -> tree_218 | node_218 : tree_218 -> tree_218 -> tree_218.
Fixpoint mirror_218 (t : tree_218) : tree_218 := match t with leaf_218 n => leaf_218 n | node_218 l r => node_218 (mirror_218 r) (mirror_218 l) end.
Fixpoint size_218 (t : tree_218) : nat := match t with leaf_218 _ => 1 | node_218 l r => S (size_218 l + size_218 r) end.
Theorem mirror_involutive_218 : forall t, mirror_218 (mirror_218 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_218 : forall t, size_218 (mirror_218 t) = size_218 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_038.

