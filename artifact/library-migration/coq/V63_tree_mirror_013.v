(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_013.
Require Import Coq.Arith.PeanoNat.

Inductive tree_13 :=
| leaf_13 : nat -> tree_13
| node_13 : tree_13 -> tree_13 -> tree_13.

Fixpoint mirror_13 (t : tree_13) : tree_13 :=
  match t with
  | leaf_13 n => leaf_13 n
  | node_13 l r => node_13 (mirror_13 r) (mirror_13 l)
  end.

Fixpoint size_13 (t : tree_13) : nat :=
  match t with
  | leaf_13 _ => 1
  | node_13 l r => S (size_13 l + size_13 r)
  end.

Theorem mirror_involutive_13 : forall t : tree_13, mirror_13 (mirror_13 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_13 : forall t : tree_13, size_13 (mirror_13 t) = size_13 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_13 : forall n, mirror_13 (leaf_13 n) = leaf_13 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_013.

