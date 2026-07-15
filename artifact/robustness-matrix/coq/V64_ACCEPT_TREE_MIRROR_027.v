(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_027.
Require Import Coq.Arith.PeanoNat.
Inductive tree_207 := leaf_207 : nat -> tree_207 | node_207 : tree_207 -> tree_207 -> tree_207.
Fixpoint mirror_207 (t : tree_207) : tree_207 := match t with leaf_207 n => leaf_207 n | node_207 l r => node_207 (mirror_207 r) (mirror_207 l) end.
Fixpoint size_207 (t : tree_207) : nat := match t with leaf_207 _ => 1 | node_207 l r => S (size_207 l + size_207 r) end.
Theorem mirror_involutive_207 : forall t, mirror_207 (mirror_207 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_207 : forall t, size_207 (mirror_207 t) = size_207 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_027.

