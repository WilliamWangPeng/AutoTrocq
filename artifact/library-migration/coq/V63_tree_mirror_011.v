(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_011.
Require Import Coq.Arith.PeanoNat.

Inductive tree_11 :=
| leaf_11 : nat -> tree_11
| node_11 : tree_11 -> tree_11 -> tree_11.

Fixpoint mirror_11 (t : tree_11) : tree_11 :=
  match t with
  | leaf_11 n => leaf_11 n
  | node_11 l r => node_11 (mirror_11 r) (mirror_11 l)
  end.

Fixpoint size_11 (t : tree_11) : nat :=
  match t with
  | leaf_11 _ => 1
  | node_11 l r => S (size_11 l + size_11 r)
  end.

Theorem mirror_involutive_11 : forall t : tree_11, mirror_11 (mirror_11 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_11 : forall t : tree_11, size_11 (mirror_11 t) = size_11 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_11 : forall n, mirror_11 (leaf_11 n) = leaf_11 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_011.

