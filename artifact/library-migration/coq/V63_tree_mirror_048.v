(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_048.
Require Import Coq.Arith.PeanoNat.

Inductive tree_48 :=
| leaf_48 : nat -> tree_48
| node_48 : tree_48 -> tree_48 -> tree_48.

Fixpoint mirror_48 (t : tree_48) : tree_48 :=
  match t with
  | leaf_48 n => leaf_48 n
  | node_48 l r => node_48 (mirror_48 r) (mirror_48 l)
  end.

Fixpoint size_48 (t : tree_48) : nat :=
  match t with
  | leaf_48 _ => 1
  | node_48 l r => S (size_48 l + size_48 r)
  end.

Theorem mirror_involutive_48 : forall t : tree_48, mirror_48 (mirror_48 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_48 : forall t : tree_48, size_48 (mirror_48 t) = size_48 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_48 : forall n, mirror_48 (leaf_48 n) = leaf_48 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_048.

