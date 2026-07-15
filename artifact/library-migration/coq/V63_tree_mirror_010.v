(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_010.
Require Import Coq.Arith.PeanoNat.

Inductive tree_10 :=
| leaf_10 : nat -> tree_10
| node_10 : tree_10 -> tree_10 -> tree_10.

Fixpoint mirror_10 (t : tree_10) : tree_10 :=
  match t with
  | leaf_10 n => leaf_10 n
  | node_10 l r => node_10 (mirror_10 r) (mirror_10 l)
  end.

Fixpoint size_10 (t : tree_10) : nat :=
  match t with
  | leaf_10 _ => 1
  | node_10 l r => S (size_10 l + size_10 r)
  end.

Theorem mirror_involutive_10 : forall t : tree_10, mirror_10 (mirror_10 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_10 : forall t : tree_10, size_10 (mirror_10 t) = size_10 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_10 : forall n, mirror_10 (leaf_10 n) = leaf_10 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_010.

