(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_034.
Require Import Coq.Arith.PeanoNat.
Inductive tree_214 := leaf_214 : nat -> tree_214 | node_214 : tree_214 -> tree_214 -> tree_214.
Fixpoint mirror_214 (t : tree_214) : tree_214 := match t with leaf_214 n => leaf_214 n | node_214 l r => node_214 (mirror_214 r) (mirror_214 l) end.
Fixpoint size_214 (t : tree_214) : nat := match t with leaf_214 _ => 1 | node_214 l r => S (size_214 l + size_214 r) end.
Theorem mirror_involutive_214 : forall t, mirror_214 (mirror_214 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_214 : forall t, size_214 (mirror_214 t) = size_214 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_034.

