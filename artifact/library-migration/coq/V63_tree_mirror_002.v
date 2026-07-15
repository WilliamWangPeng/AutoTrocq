(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_002.
Require Import Coq.Arith.PeanoNat.

Inductive tree_2 :=
| leaf_2 : nat -> tree_2
| node_2 : tree_2 -> tree_2 -> tree_2.

Fixpoint mirror_2 (t : tree_2) : tree_2 :=
  match t with
  | leaf_2 n => leaf_2 n
  | node_2 l r => node_2 (mirror_2 r) (mirror_2 l)
  end.

Fixpoint size_2 (t : tree_2) : nat :=
  match t with
  | leaf_2 _ => 1
  | node_2 l r => S (size_2 l + size_2 r)
  end.

Theorem mirror_involutive_2 : forall t : tree_2, mirror_2 (mirror_2 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_2 : forall t : tree_2, size_2 (mirror_2 t) = size_2 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_2 : forall n, mirror_2 (leaf_2 n) = leaf_2 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_002.

