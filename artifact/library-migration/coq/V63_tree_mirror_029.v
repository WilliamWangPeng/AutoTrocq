(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_029.
Require Import Coq.Arith.PeanoNat.

Inductive tree_29 :=
| leaf_29 : nat -> tree_29
| node_29 : tree_29 -> tree_29 -> tree_29.

Fixpoint mirror_29 (t : tree_29) : tree_29 :=
  match t with
  | leaf_29 n => leaf_29 n
  | node_29 l r => node_29 (mirror_29 r) (mirror_29 l)
  end.

Fixpoint size_29 (t : tree_29) : nat :=
  match t with
  | leaf_29 _ => 1
  | node_29 l r => S (size_29 l + size_29 r)
  end.

Theorem mirror_involutive_29 : forall t : tree_29, mirror_29 (mirror_29 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_29 : forall t : tree_29, size_29 (mirror_29 t) = size_29 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_29 : forall n, mirror_29 (leaf_29 n) = leaf_29 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_029.

