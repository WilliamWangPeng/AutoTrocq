(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_036.
Require Import Coq.Arith.PeanoNat.

Inductive tree_36 :=
| leaf_36 : nat -> tree_36
| node_36 : tree_36 -> tree_36 -> tree_36.

Fixpoint mirror_36 (t : tree_36) : tree_36 :=
  match t with
  | leaf_36 n => leaf_36 n
  | node_36 l r => node_36 (mirror_36 r) (mirror_36 l)
  end.

Fixpoint size_36 (t : tree_36) : nat :=
  match t with
  | leaf_36 _ => 1
  | node_36 l r => S (size_36 l + size_36 r)
  end.

Theorem mirror_involutive_36 : forall t : tree_36, mirror_36 (mirror_36 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_36 : forall t : tree_36, size_36 (mirror_36 t) = size_36 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_36 : forall n, mirror_36 (leaf_36 n) = leaf_36 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_036.

