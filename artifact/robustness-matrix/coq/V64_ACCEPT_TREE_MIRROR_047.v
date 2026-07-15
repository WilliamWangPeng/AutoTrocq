(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_047.
Require Import Coq.Arith.PeanoNat.
Inductive tree_227 := leaf_227 : nat -> tree_227 | node_227 : tree_227 -> tree_227 -> tree_227.
Fixpoint mirror_227 (t : tree_227) : tree_227 := match t with leaf_227 n => leaf_227 n | node_227 l r => node_227 (mirror_227 r) (mirror_227 l) end.
Fixpoint size_227 (t : tree_227) : nat := match t with leaf_227 _ => 1 | node_227 l r => S (size_227 l + size_227 r) end.
Theorem mirror_involutive_227 : forall t, mirror_227 (mirror_227 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_227 : forall t, size_227 (mirror_227 t) = size_227 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_047.

