(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_015.
Require Import Coq.Arith.PeanoNat.

Inductive tree_15 :=
| leaf_15 : nat -> tree_15
| node_15 : tree_15 -> tree_15 -> tree_15.

Fixpoint mirror_15 (t : tree_15) : tree_15 :=
  match t with
  | leaf_15 n => leaf_15 n
  | node_15 l r => node_15 (mirror_15 r) (mirror_15 l)
  end.

Fixpoint size_15 (t : tree_15) : nat :=
  match t with
  | leaf_15 _ => 1
  | node_15 l r => S (size_15 l + size_15 r)
  end.

Theorem mirror_involutive_15 : forall t : tree_15, mirror_15 (mirror_15 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_15 : forall t : tree_15, size_15 (mirror_15 t) = size_15 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_15 : forall n, mirror_15 (leaf_15 n) = leaf_15 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_015.

