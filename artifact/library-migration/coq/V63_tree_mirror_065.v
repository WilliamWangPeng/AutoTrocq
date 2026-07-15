(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_065.
Require Import Coq.Arith.PeanoNat.

Inductive tree_65 :=
| leaf_65 : nat -> tree_65
| node_65 : tree_65 -> tree_65 -> tree_65.

Fixpoint mirror_65 (t : tree_65) : tree_65 :=
  match t with
  | leaf_65 n => leaf_65 n
  | node_65 l r => node_65 (mirror_65 r) (mirror_65 l)
  end.

Fixpoint size_65 (t : tree_65) : nat :=
  match t with
  | leaf_65 _ => 1
  | node_65 l r => S (size_65 l + size_65 r)
  end.

Theorem mirror_involutive_65 : forall t : tree_65, mirror_65 (mirror_65 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_65 : forall t : tree_65, size_65 (mirror_65 t) = size_65 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_65 : forall n, mirror_65 (leaf_65 n) = leaf_65 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_065.

