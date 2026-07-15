(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_059.
Require Import Coq.Arith.PeanoNat.

Inductive tree_59 :=
| leaf_59 : nat -> tree_59
| node_59 : tree_59 -> tree_59 -> tree_59.

Fixpoint mirror_59 (t : tree_59) : tree_59 :=
  match t with
  | leaf_59 n => leaf_59 n
  | node_59 l r => node_59 (mirror_59 r) (mirror_59 l)
  end.

Fixpoint size_59 (t : tree_59) : nat :=
  match t with
  | leaf_59 _ => 1
  | node_59 l r => S (size_59 l + size_59 r)
  end.

Theorem mirror_involutive_59 : forall t : tree_59, mirror_59 (mirror_59 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_59 : forall t : tree_59, size_59 (mirror_59 t) = size_59 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_59 : forall n, mirror_59 (leaf_59 n) = leaf_59 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_059.

