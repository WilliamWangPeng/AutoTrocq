(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_012.
Require Import Coq.Arith.PeanoNat.

Inductive tree_12 :=
| leaf_12 : nat -> tree_12
| node_12 : tree_12 -> tree_12 -> tree_12.

Fixpoint mirror_12 (t : tree_12) : tree_12 :=
  match t with
  | leaf_12 n => leaf_12 n
  | node_12 l r => node_12 (mirror_12 r) (mirror_12 l)
  end.

Fixpoint size_12 (t : tree_12) : nat :=
  match t with
  | leaf_12 _ => 1
  | node_12 l r => S (size_12 l + size_12 r)
  end.

Theorem mirror_involutive_12 : forall t : tree_12, mirror_12 (mirror_12 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_12 : forall t : tree_12, size_12 (mirror_12 t) = size_12 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_12 : forall n, mirror_12 (leaf_12 n) = leaf_12 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_012.

