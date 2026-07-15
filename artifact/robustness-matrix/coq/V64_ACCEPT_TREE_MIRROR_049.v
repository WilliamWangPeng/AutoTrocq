(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_049.
Require Import Coq.Arith.PeanoNat.
Inductive tree_229 := leaf_229 : nat -> tree_229 | node_229 : tree_229 -> tree_229 -> tree_229.
Fixpoint mirror_229 (t : tree_229) : tree_229 := match t with leaf_229 n => leaf_229 n | node_229 l r => node_229 (mirror_229 r) (mirror_229 l) end.
Fixpoint size_229 (t : tree_229) : nat := match t with leaf_229 _ => 1 | node_229 l r => S (size_229 l + size_229 r) end.
Theorem mirror_involutive_229 : forall t, mirror_229 (mirror_229 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_229 : forall t, size_229 (mirror_229 t) = size_229 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_049.

