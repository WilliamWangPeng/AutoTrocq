(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_015.
Require Import Coq.Arith.PeanoNat.
Inductive tree_195 := leaf_195 : nat -> tree_195 | node_195 : tree_195 -> tree_195 -> tree_195.
Fixpoint mirror_195 (t : tree_195) : tree_195 := match t with leaf_195 n => leaf_195 n | node_195 l r => node_195 (mirror_195 r) (mirror_195 l) end.
Fixpoint size_195 (t : tree_195) : nat := match t with leaf_195 _ => 1 | node_195 l r => S (size_195 l + size_195 r) end.
Theorem mirror_involutive_195 : forall t, mirror_195 (mirror_195 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_195 : forall t, size_195 (mirror_195 t) = size_195 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_015.

