(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_016.
Require Import Coq.Arith.PeanoNat.
Inductive tree_196 := leaf_196 : nat -> tree_196 | node_196 : tree_196 -> tree_196 -> tree_196.
Fixpoint mirror_196 (t : tree_196) : tree_196 := match t with leaf_196 n => leaf_196 n | node_196 l r => node_196 (mirror_196 r) (mirror_196 l) end.
Fixpoint size_196 (t : tree_196) : nat := match t with leaf_196 _ => 1 | node_196 l r => S (size_196 l + size_196 r) end.
Theorem mirror_involutive_196 : forall t, mirror_196 (mirror_196 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_196 : forall t, size_196 (mirror_196 t) = size_196 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_016.

