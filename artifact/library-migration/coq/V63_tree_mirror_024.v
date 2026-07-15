(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_024.
Require Import Coq.Arith.PeanoNat.

Inductive tree_24 :=
| leaf_24 : nat -> tree_24
| node_24 : tree_24 -> tree_24 -> tree_24.

Fixpoint mirror_24 (t : tree_24) : tree_24 :=
  match t with
  | leaf_24 n => leaf_24 n
  | node_24 l r => node_24 (mirror_24 r) (mirror_24 l)
  end.

Fixpoint size_24 (t : tree_24) : nat :=
  match t with
  | leaf_24 _ => 1
  | node_24 l r => S (size_24 l + size_24 r)
  end.

Theorem mirror_involutive_24 : forall t : tree_24, mirror_24 (mirror_24 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_24 : forall t : tree_24, size_24 (mirror_24 t) = size_24 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_24 : forall n, mirror_24 (leaf_24 n) = leaf_24 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_024.

