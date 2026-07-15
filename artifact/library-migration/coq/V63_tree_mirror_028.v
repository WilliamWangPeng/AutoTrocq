(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_028.
Require Import Coq.Arith.PeanoNat.

Inductive tree_28 :=
| leaf_28 : nat -> tree_28
| node_28 : tree_28 -> tree_28 -> tree_28.

Fixpoint mirror_28 (t : tree_28) : tree_28 :=
  match t with
  | leaf_28 n => leaf_28 n
  | node_28 l r => node_28 (mirror_28 r) (mirror_28 l)
  end.

Fixpoint size_28 (t : tree_28) : nat :=
  match t with
  | leaf_28 _ => 1
  | node_28 l r => S (size_28 l + size_28 r)
  end.

Theorem mirror_involutive_28 : forall t : tree_28, mirror_28 (mirror_28 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_28 : forall t : tree_28, size_28 (mirror_28 t) = size_28 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_28 : forall n, mirror_28 (leaf_28 n) = leaf_28 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_028.

