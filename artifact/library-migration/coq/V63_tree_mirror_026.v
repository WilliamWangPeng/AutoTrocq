(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_026.
Require Import Coq.Arith.PeanoNat.

Inductive tree_26 :=
| leaf_26 : nat -> tree_26
| node_26 : tree_26 -> tree_26 -> tree_26.

Fixpoint mirror_26 (t : tree_26) : tree_26 :=
  match t with
  | leaf_26 n => leaf_26 n
  | node_26 l r => node_26 (mirror_26 r) (mirror_26 l)
  end.

Fixpoint size_26 (t : tree_26) : nat :=
  match t with
  | leaf_26 _ => 1
  | node_26 l r => S (size_26 l + size_26 r)
  end.

Theorem mirror_involutive_26 : forall t : tree_26, mirror_26 (mirror_26 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_26 : forall t : tree_26, size_26 (mirror_26 t) = size_26 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_26 : forall n, mirror_26 (leaf_26 n) = leaf_26 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_026.

