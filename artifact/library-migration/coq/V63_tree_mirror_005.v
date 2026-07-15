(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_005.
Require Import Coq.Arith.PeanoNat.

Inductive tree_5 :=
| leaf_5 : nat -> tree_5
| node_5 : tree_5 -> tree_5 -> tree_5.

Fixpoint mirror_5 (t : tree_5) : tree_5 :=
  match t with
  | leaf_5 n => leaf_5 n
  | node_5 l r => node_5 (mirror_5 r) (mirror_5 l)
  end.

Fixpoint size_5 (t : tree_5) : nat :=
  match t with
  | leaf_5 _ => 1
  | node_5 l r => S (size_5 l + size_5 r)
  end.

Theorem mirror_involutive_5 : forall t : tree_5, mirror_5 (mirror_5 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_5 : forall t : tree_5, size_5 (mirror_5 t) = size_5 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_5 : forall n, mirror_5 (leaf_5 n) = leaf_5 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_005.

