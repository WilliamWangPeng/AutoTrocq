(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_039.
Require Import Coq.Arith.PeanoNat.

Inductive tree_39 :=
| leaf_39 : nat -> tree_39
| node_39 : tree_39 -> tree_39 -> tree_39.

Fixpoint mirror_39 (t : tree_39) : tree_39 :=
  match t with
  | leaf_39 n => leaf_39 n
  | node_39 l r => node_39 (mirror_39 r) (mirror_39 l)
  end.

Fixpoint size_39 (t : tree_39) : nat :=
  match t with
  | leaf_39 _ => 1
  | node_39 l r => S (size_39 l + size_39 r)
  end.

Theorem mirror_involutive_39 : forall t : tree_39, mirror_39 (mirror_39 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_39 : forall t : tree_39, size_39 (mirror_39 t) = size_39 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_39 : forall n, mirror_39 (leaf_39 n) = leaf_39 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_039.

