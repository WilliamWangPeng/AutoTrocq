(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_050.
Require Import Coq.Arith.PeanoNat.

Inductive tree_50 :=
| leaf_50 : nat -> tree_50
| node_50 : tree_50 -> tree_50 -> tree_50.

Fixpoint mirror_50 (t : tree_50) : tree_50 :=
  match t with
  | leaf_50 n => leaf_50 n
  | node_50 l r => node_50 (mirror_50 r) (mirror_50 l)
  end.

Fixpoint size_50 (t : tree_50) : nat :=
  match t with
  | leaf_50 _ => 1
  | node_50 l r => S (size_50 l + size_50 r)
  end.

Theorem mirror_involutive_50 : forall t : tree_50, mirror_50 (mirror_50 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_50 : forall t : tree_50, size_50 (mirror_50 t) = size_50 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_50 : forall n, mirror_50 (leaf_50 n) = leaf_50 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_050.

