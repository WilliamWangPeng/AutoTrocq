(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_020.
Require Import Coq.Arith.PeanoNat.

Inductive tree_20 :=
| leaf_20 : nat -> tree_20
| node_20 : tree_20 -> tree_20 -> tree_20.

Fixpoint mirror_20 (t : tree_20) : tree_20 :=
  match t with
  | leaf_20 n => leaf_20 n
  | node_20 l r => node_20 (mirror_20 r) (mirror_20 l)
  end.

Fixpoint size_20 (t : tree_20) : nat :=
  match t with
  | leaf_20 _ => 1
  | node_20 l r => S (size_20 l + size_20 r)
  end.

Theorem mirror_involutive_20 : forall t : tree_20, mirror_20 (mirror_20 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_20 : forall t : tree_20, size_20 (mirror_20 t) = size_20 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_20 : forall n, mirror_20 (leaf_20 n) = leaf_20 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_020.

