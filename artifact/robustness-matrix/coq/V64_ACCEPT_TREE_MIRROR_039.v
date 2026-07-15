(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_039.
Require Import Coq.Arith.PeanoNat.
Inductive tree_219 := leaf_219 : nat -> tree_219 | node_219 : tree_219 -> tree_219 -> tree_219.
Fixpoint mirror_219 (t : tree_219) : tree_219 := match t with leaf_219 n => leaf_219 n | node_219 l r => node_219 (mirror_219 r) (mirror_219 l) end.
Fixpoint size_219 (t : tree_219) : nat := match t with leaf_219 _ => 1 | node_219 l r => S (size_219 l + size_219 r) end.
Theorem mirror_involutive_219 : forall t, mirror_219 (mirror_219 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_219 : forall t, size_219 (mirror_219 t) = size_219 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_039.

