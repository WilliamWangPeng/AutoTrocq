(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_004.
Require Import Coq.Arith.PeanoNat.
Inductive tree_184 := leaf_184 : nat -> tree_184 | node_184 : tree_184 -> tree_184 -> tree_184.
Fixpoint mirror_184 (t : tree_184) : tree_184 := match t with leaf_184 n => leaf_184 n | node_184 l r => node_184 (mirror_184 r) (mirror_184 l) end.
Fixpoint size_184 (t : tree_184) : nat := match t with leaf_184 _ => 1 | node_184 l r => S (size_184 l + size_184 r) end.
Theorem mirror_involutive_184 : forall t, mirror_184 (mirror_184 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_184 : forall t, size_184 (mirror_184 t) = size_184 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_004.

