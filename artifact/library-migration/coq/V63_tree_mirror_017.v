(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_017.
Require Import Coq.Arith.PeanoNat.

Inductive tree_17 :=
| leaf_17 : nat -> tree_17
| node_17 : tree_17 -> tree_17 -> tree_17.

Fixpoint mirror_17 (t : tree_17) : tree_17 :=
  match t with
  | leaf_17 n => leaf_17 n
  | node_17 l r => node_17 (mirror_17 r) (mirror_17 l)
  end.

Fixpoint size_17 (t : tree_17) : nat :=
  match t with
  | leaf_17 _ => 1
  | node_17 l r => S (size_17 l + size_17 r)
  end.

Theorem mirror_involutive_17 : forall t : tree_17, mirror_17 (mirror_17 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_17 : forall t : tree_17, size_17 (mirror_17 t) = size_17 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_17 : forall n, mirror_17 (leaf_17 n) = leaf_17 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_017.

