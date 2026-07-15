(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_028.
Require Import Coq.Arith.PeanoNat.
Inductive tree_208 := leaf_208 : nat -> tree_208 | node_208 : tree_208 -> tree_208 -> tree_208.
Fixpoint mirror_208 (t : tree_208) : tree_208 := match t with leaf_208 n => leaf_208 n | node_208 l r => node_208 (mirror_208 r) (mirror_208 l) end.
Fixpoint size_208 (t : tree_208) : nat := match t with leaf_208 _ => 1 | node_208 l r => S (size_208 l + size_208 r) end.
Theorem mirror_involutive_208 : forall t, mirror_208 (mirror_208 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_208 : forall t, size_208 (mirror_208 t) = size_208 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_028.

