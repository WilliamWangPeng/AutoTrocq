(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_031.
Require Import Coq.Arith.PeanoNat.

Inductive tree_31 :=
| leaf_31 : nat -> tree_31
| node_31 : tree_31 -> tree_31 -> tree_31.

Fixpoint mirror_31 (t : tree_31) : tree_31 :=
  match t with
  | leaf_31 n => leaf_31 n
  | node_31 l r => node_31 (mirror_31 r) (mirror_31 l)
  end.

Fixpoint size_31 (t : tree_31) : nat :=
  match t with
  | leaf_31 _ => 1
  | node_31 l r => S (size_31 l + size_31 r)
  end.

Theorem mirror_involutive_31 : forall t : tree_31, mirror_31 (mirror_31 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_31 : forall t : tree_31, size_31 (mirror_31 t) = size_31 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_31 : forall n, mirror_31 (leaf_31 n) = leaf_31 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_031.

