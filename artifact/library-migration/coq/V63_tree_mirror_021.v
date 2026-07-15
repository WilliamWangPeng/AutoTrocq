(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_021.
Require Import Coq.Arith.PeanoNat.

Inductive tree_21 :=
| leaf_21 : nat -> tree_21
| node_21 : tree_21 -> tree_21 -> tree_21.

Fixpoint mirror_21 (t : tree_21) : tree_21 :=
  match t with
  | leaf_21 n => leaf_21 n
  | node_21 l r => node_21 (mirror_21 r) (mirror_21 l)
  end.

Fixpoint size_21 (t : tree_21) : nat :=
  match t with
  | leaf_21 _ => 1
  | node_21 l r => S (size_21 l + size_21 r)
  end.

Theorem mirror_involutive_21 : forall t : tree_21, mirror_21 (mirror_21 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_21 : forall t : tree_21, size_21 (mirror_21 t) = size_21 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_21 : forall n, mirror_21 (leaf_21 n) = leaf_21 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_021.

