(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_049.
Require Import Coq.Arith.PeanoNat.

Inductive tree_49 :=
| leaf_49 : nat -> tree_49
| node_49 : tree_49 -> tree_49 -> tree_49.

Fixpoint mirror_49 (t : tree_49) : tree_49 :=
  match t with
  | leaf_49 n => leaf_49 n
  | node_49 l r => node_49 (mirror_49 r) (mirror_49 l)
  end.

Fixpoint size_49 (t : tree_49) : nat :=
  match t with
  | leaf_49 _ => 1
  | node_49 l r => S (size_49 l + size_49 r)
  end.

Theorem mirror_involutive_49 : forall t : tree_49, mirror_49 (mirror_49 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_49 : forall t : tree_49, size_49 (mirror_49 t) = size_49 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_49 : forall n, mirror_49 (leaf_49 n) = leaf_49 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_049.

