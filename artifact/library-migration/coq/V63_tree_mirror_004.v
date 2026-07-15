(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_004.
Require Import Coq.Arith.PeanoNat.

Inductive tree_4 :=
| leaf_4 : nat -> tree_4
| node_4 : tree_4 -> tree_4 -> tree_4.

Fixpoint mirror_4 (t : tree_4) : tree_4 :=
  match t with
  | leaf_4 n => leaf_4 n
  | node_4 l r => node_4 (mirror_4 r) (mirror_4 l)
  end.

Fixpoint size_4 (t : tree_4) : nat :=
  match t with
  | leaf_4 _ => 1
  | node_4 l r => S (size_4 l + size_4 r)
  end.

Theorem mirror_involutive_4 : forall t : tree_4, mirror_4 (mirror_4 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_4 : forall t : tree_4, size_4 (mirror_4 t) = size_4 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_4 : forall n, mirror_4 (leaf_4 n) = leaf_4 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_004.

