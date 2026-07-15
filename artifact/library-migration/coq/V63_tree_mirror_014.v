(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_014.
Require Import Coq.Arith.PeanoNat.

Inductive tree_14 :=
| leaf_14 : nat -> tree_14
| node_14 : tree_14 -> tree_14 -> tree_14.

Fixpoint mirror_14 (t : tree_14) : tree_14 :=
  match t with
  | leaf_14 n => leaf_14 n
  | node_14 l r => node_14 (mirror_14 r) (mirror_14 l)
  end.

Fixpoint size_14 (t : tree_14) : nat :=
  match t with
  | leaf_14 _ => 1
  | node_14 l r => S (size_14 l + size_14 r)
  end.

Theorem mirror_involutive_14 : forall t : tree_14, mirror_14 (mirror_14 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_14 : forall t : tree_14, size_14 (mirror_14 t) = size_14 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_14 : forall n, mirror_14 (leaf_14 n) = leaf_14 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_014.

