(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_057.
Require Import Coq.Arith.PeanoNat.

Inductive tree_57 :=
| leaf_57 : nat -> tree_57
| node_57 : tree_57 -> tree_57 -> tree_57.

Fixpoint mirror_57 (t : tree_57) : tree_57 :=
  match t with
  | leaf_57 n => leaf_57 n
  | node_57 l r => node_57 (mirror_57 r) (mirror_57 l)
  end.

Fixpoint size_57 (t : tree_57) : nat :=
  match t with
  | leaf_57 _ => 1
  | node_57 l r => S (size_57 l + size_57 r)
  end.

Theorem mirror_involutive_57 : forall t : tree_57, mirror_57 (mirror_57 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_57 : forall t : tree_57, size_57 (mirror_57 t) = size_57 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_57 : forall n, mirror_57 (leaf_57 n) = leaf_57 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_057.

