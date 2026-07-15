(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_016.
Require Import Coq.Arith.PeanoNat.

Inductive tree_16 :=
| leaf_16 : nat -> tree_16
| node_16 : tree_16 -> tree_16 -> tree_16.

Fixpoint mirror_16 (t : tree_16) : tree_16 :=
  match t with
  | leaf_16 n => leaf_16 n
  | node_16 l r => node_16 (mirror_16 r) (mirror_16 l)
  end.

Fixpoint size_16 (t : tree_16) : nat :=
  match t with
  | leaf_16 _ => 1
  | node_16 l r => S (size_16 l + size_16 r)
  end.

Theorem mirror_involutive_16 : forall t : tree_16, mirror_16 (mirror_16 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_16 : forall t : tree_16, size_16 (mirror_16 t) = size_16 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_16 : forall n, mirror_16 (leaf_16 n) = leaf_16 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_016.

