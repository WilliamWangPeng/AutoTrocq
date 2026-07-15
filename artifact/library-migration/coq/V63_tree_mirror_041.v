(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_041.
Require Import Coq.Arith.PeanoNat.

Inductive tree_41 :=
| leaf_41 : nat -> tree_41
| node_41 : tree_41 -> tree_41 -> tree_41.

Fixpoint mirror_41 (t : tree_41) : tree_41 :=
  match t with
  | leaf_41 n => leaf_41 n
  | node_41 l r => node_41 (mirror_41 r) (mirror_41 l)
  end.

Fixpoint size_41 (t : tree_41) : nat :=
  match t with
  | leaf_41 _ => 1
  | node_41 l r => S (size_41 l + size_41 r)
  end.

Theorem mirror_involutive_41 : forall t : tree_41, mirror_41 (mirror_41 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_41 : forall t : tree_41, size_41 (mirror_41 t) = size_41 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_41 : forall n, mirror_41 (leaf_41 n) = leaf_41 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_041.

