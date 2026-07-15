(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_023.
Require Import Coq.Arith.PeanoNat.

Inductive tree_23 :=
| leaf_23 : nat -> tree_23
| node_23 : tree_23 -> tree_23 -> tree_23.

Fixpoint mirror_23 (t : tree_23) : tree_23 :=
  match t with
  | leaf_23 n => leaf_23 n
  | node_23 l r => node_23 (mirror_23 r) (mirror_23 l)
  end.

Fixpoint size_23 (t : tree_23) : nat :=
  match t with
  | leaf_23 _ => 1
  | node_23 l r => S (size_23 l + size_23 r)
  end.

Theorem mirror_involutive_23 : forall t : tree_23, mirror_23 (mirror_23 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_23 : forall t : tree_23, size_23 (mirror_23 t) = size_23 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_23 : forall n, mirror_23 (leaf_23 n) = leaf_23 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_023.

