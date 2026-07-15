(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_008.
Require Import Coq.Arith.PeanoNat.

Inductive tree_8 :=
| leaf_8 : nat -> tree_8
| node_8 : tree_8 -> tree_8 -> tree_8.

Fixpoint mirror_8 (t : tree_8) : tree_8 :=
  match t with
  | leaf_8 n => leaf_8 n
  | node_8 l r => node_8 (mirror_8 r) (mirror_8 l)
  end.

Fixpoint size_8 (t : tree_8) : nat :=
  match t with
  | leaf_8 _ => 1
  | node_8 l r => S (size_8 l + size_8 r)
  end.

Theorem mirror_involutive_8 : forall t : tree_8, mirror_8 (mirror_8 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_8 : forall t : tree_8, size_8 (mirror_8 t) = size_8 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_8 : forall n, mirror_8 (leaf_8 n) = leaf_8 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_008.

