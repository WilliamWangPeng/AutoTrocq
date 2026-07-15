(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_036.
Require Import Coq.Arith.PeanoNat.
Inductive tree_216 := leaf_216 : nat -> tree_216 | node_216 : tree_216 -> tree_216 -> tree_216.
Fixpoint mirror_216 (t : tree_216) : tree_216 := match t with leaf_216 n => leaf_216 n | node_216 l r => node_216 (mirror_216 r) (mirror_216 l) end.
Fixpoint size_216 (t : tree_216) : nat := match t with leaf_216 _ => 1 | node_216 l r => S (size_216 l + size_216 r) end.
Theorem mirror_involutive_216 : forall t, mirror_216 (mirror_216 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_216 : forall t, size_216 (mirror_216 t) = size_216 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_036.

