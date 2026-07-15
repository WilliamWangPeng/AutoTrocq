(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_060.
Require Import Coq.Arith.PeanoNat.

Inductive tree_60 :=
| leaf_60 : nat -> tree_60
| node_60 : tree_60 -> tree_60 -> tree_60.

Fixpoint mirror_60 (t : tree_60) : tree_60 :=
  match t with
  | leaf_60 n => leaf_60 n
  | node_60 l r => node_60 (mirror_60 r) (mirror_60 l)
  end.

Fixpoint size_60 (t : tree_60) : nat :=
  match t with
  | leaf_60 _ => 1
  | node_60 l r => S (size_60 l + size_60 r)
  end.

Theorem mirror_involutive_60 : forall t : tree_60, mirror_60 (mirror_60 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_60 : forall t : tree_60, size_60 (mirror_60 t) = size_60 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_60 : forall n, mirror_60 (leaf_60 n) = leaf_60 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_060.

