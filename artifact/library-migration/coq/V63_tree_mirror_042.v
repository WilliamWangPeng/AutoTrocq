(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_042.
Require Import Coq.Arith.PeanoNat.

Inductive tree_42 :=
| leaf_42 : nat -> tree_42
| node_42 : tree_42 -> tree_42 -> tree_42.

Fixpoint mirror_42 (t : tree_42) : tree_42 :=
  match t with
  | leaf_42 n => leaf_42 n
  | node_42 l r => node_42 (mirror_42 r) (mirror_42 l)
  end.

Fixpoint size_42 (t : tree_42) : nat :=
  match t with
  | leaf_42 _ => 1
  | node_42 l r => S (size_42 l + size_42 r)
  end.

Theorem mirror_involutive_42 : forall t : tree_42, mirror_42 (mirror_42 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_42 : forall t : tree_42, size_42 (mirror_42 t) = size_42 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_42 : forall n, mirror_42 (leaf_42 n) = leaf_42 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_042.

