(* V64 robustness-matrix module *)
Module V64_ACCEPT_TREE_MIRROR_029.
Require Import Coq.Arith.PeanoNat.
Inductive tree_209 := leaf_209 : nat -> tree_209 | node_209 : tree_209 -> tree_209 -> tree_209.
Fixpoint mirror_209 (t : tree_209) : tree_209 := match t with leaf_209 n => leaf_209 n | node_209 l r => node_209 (mirror_209 r) (mirror_209 l) end.
Fixpoint size_209 (t : tree_209) : nat := match t with leaf_209 _ => 1 | node_209 l r => S (size_209 l + size_209 r) end.
Theorem mirror_involutive_209 : forall t, mirror_209 (mirror_209 t) = t.
Proof. induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr. Qed.
Theorem size_transfer_209 : forall t, size_209 (mirror_209 t) = size_209 t.
Proof. induction t as [n|l IHl r IHr]; simpl; try reflexivity; now rewrite IHl, IHr, Nat.add_comm. Qed.
End V64_ACCEPT_TREE_MIRROR_029.

