(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_001.
Require Import Coq.Arith.PeanoNat.

Inductive tree_1 :=
| leaf_1 : nat -> tree_1
| node_1 : tree_1 -> tree_1 -> tree_1.

Fixpoint mirror_1 (t : tree_1) : tree_1 :=
  match t with
  | leaf_1 n => leaf_1 n
  | node_1 l r => node_1 (mirror_1 r) (mirror_1 l)
  end.

Fixpoint size_1 (t : tree_1) : nat :=
  match t with
  | leaf_1 _ => 1
  | node_1 l r => S (size_1 l + size_1 r)
  end.

Theorem mirror_involutive_1 : forall t : tree_1, mirror_1 (mirror_1 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_1 : forall t : tree_1, size_1 (mirror_1 t) = size_1 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_1 : forall n, mirror_1 (leaf_1 n) = leaf_1 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_001.

