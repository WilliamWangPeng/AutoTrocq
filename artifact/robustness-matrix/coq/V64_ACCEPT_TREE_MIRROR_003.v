(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_003.
Require Import Coq.Arith.PeanoNat.
Inductive tree_183 := leaf_183 : nat -> tree_183 | node_183 : tree_183 -> tree_183 -> tree_183.
Fixpoint mirror_183 (t : tree_183) : tree_183 := match t with leaf_183 n => leaf_183 n | node_183 l r => node_183 (mirror_183 r) (mirror_183 l) end.
Fixpoint size_183 (t : tree_183) : nat := match t with leaf_183 _ => 1 | node_183 l r => S (size_183 l + size_183 r) end.
Theorem mirror_involutive_183 : forall t, mirror_183 (mirror_183 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_183 : forall t, size_183 (mirror_183 t) = size_183 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_003.

