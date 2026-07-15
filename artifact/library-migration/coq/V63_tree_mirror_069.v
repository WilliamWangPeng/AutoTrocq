(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_069.
Require Import Coq.Arith.PeanoNat.

Inductive tree_69 :=
| leaf_69 : nat -> tree_69
| node_69 : tree_69 -> tree_69 -> tree_69.

Fixpoint mirror_69 (t : tree_69) : tree_69 :=
  match t with
  | leaf_69 n => leaf_69 n
  | node_69 l r => node_69 (mirror_69 r) (mirror_69 l)
  end.

Fixpoint size_69 (t : tree_69) : nat :=
  match t with
  | leaf_69 _ => 1
  | node_69 l r => S (size_69 l + size_69 r)
  end.

Theorem mirror_involutive_69 : forall t : tree_69, mirror_69 (mirror_69 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_69 : forall t : tree_69, size_69 (mirror_69 t) = size_69 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_69 : forall n, mirror_69 (leaf_69 n) = leaf_69 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_069.

