(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_064.
Require Import Coq.Arith.PeanoNat.

Inductive tree_64 :=
| leaf_64 : nat -> tree_64
| node_64 : tree_64 -> tree_64 -> tree_64.

Fixpoint mirror_64 (t : tree_64) : tree_64 :=
  match t with
  | leaf_64 n => leaf_64 n
  | node_64 l r => node_64 (mirror_64 r) (mirror_64 l)
  end.

Fixpoint size_64 (t : tree_64) : nat :=
  match t with
  | leaf_64 _ => 1
  | node_64 l r => S (size_64 l + size_64 r)
  end.

Theorem mirror_involutive_64 : forall t : tree_64, mirror_64 (mirror_64 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_64 : forall t : tree_64, size_64 (mirror_64 t) = size_64 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_64 : forall n, mirror_64 (leaf_64 n) = leaf_64 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_064.

