(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_011.
Require Import Coq.Arith.PeanoNat.
Inductive tree_191 := leaf_191 : nat -> tree_191 | node_191 : tree_191 -> tree_191 -> tree_191.
Fixpoint mirror_191 (t : tree_191) : tree_191 := match t with leaf_191 n => leaf_191 n | node_191 l r => node_191 (mirror_191 r) (mirror_191 l) end.
Fixpoint size_191 (t : tree_191) : nat := match t with leaf_191 _ => 1 | node_191 l r => S (size_191 l + size_191 r) end.
Theorem mirror_involutive_191 : forall t, mirror_191 (mirror_191 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_191 : forall t, size_191 (mirror_191 t) = size_191 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_011.

