(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_030.
Require Import Coq.Arith.PeanoNat.

Inductive tree_30 :=
| leaf_30 : nat -> tree_30
| node_30 : tree_30 -> tree_30 -> tree_30.

Fixpoint mirror_30 (t : tree_30) : tree_30 :=
  match t with
  | leaf_30 n => leaf_30 n
  | node_30 l r => node_30 (mirror_30 r) (mirror_30 l)
  end.

Fixpoint size_30 (t : tree_30) : nat :=
  match t with
  | leaf_30 _ => 1
  | node_30 l r => S (size_30 l + size_30 r)
  end.

Theorem mirror_involutive_30 : forall t : tree_30, mirror_30 (mirror_30 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_30 : forall t : tree_30, size_30 (mirror_30 t) = size_30 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_30 : forall n, mirror_30 (leaf_30 n) = leaf_30 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_030.

