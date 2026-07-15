(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_035.
Require Import Coq.Arith.PeanoNat.
Inductive tree_215 := leaf_215 : nat -> tree_215 | node_215 : tree_215 -> tree_215 -> tree_215.
Fixpoint mirror_215 (t : tree_215) : tree_215 := match t with leaf_215 n => leaf_215 n | node_215 l r => node_215 (mirror_215 r) (mirror_215 l) end.
Fixpoint size_215 (t : tree_215) : nat := match t with leaf_215 _ => 1 | node_215 l r => S (size_215 l + size_215 r) end.
Theorem mirror_involutive_215 : forall t, mirror_215 (mirror_215 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_215 : forall t, size_215 (mirror_215 t) = size_215 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_035.

