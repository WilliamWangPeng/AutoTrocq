(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_040.
Require Import Coq.Arith.PeanoNat.

Inductive tree_40 :=
| leaf_40 : nat -> tree_40
| node_40 : tree_40 -> tree_40 -> tree_40.

Fixpoint mirror_40 (t : tree_40) : tree_40 :=
  match t with
  | leaf_40 n => leaf_40 n
  | node_40 l r => node_40 (mirror_40 r) (mirror_40 l)
  end.

Fixpoint size_40 (t : tree_40) : nat :=
  match t with
  | leaf_40 _ => 1
  | node_40 l r => S (size_40 l + size_40 r)
  end.

Theorem mirror_involutive_40 : forall t : tree_40, mirror_40 (mirror_40 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_40 : forall t : tree_40, size_40 (mirror_40 t) = size_40 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_40 : forall n, mirror_40 (leaf_40 n) = leaf_40 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_040.

