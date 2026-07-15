(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_066.
Require Import Coq.Arith.PeanoNat.

Inductive tree_66 :=
| leaf_66 : nat -> tree_66
| node_66 : tree_66 -> tree_66 -> tree_66.

Fixpoint mirror_66 (t : tree_66) : tree_66 :=
  match t with
  | leaf_66 n => leaf_66 n
  | node_66 l r => node_66 (mirror_66 r) (mirror_66 l)
  end.

Fixpoint size_66 (t : tree_66) : nat :=
  match t with
  | leaf_66 _ => 1
  | node_66 l r => S (size_66 l + size_66 r)
  end.

Theorem mirror_involutive_66 : forall t : tree_66, mirror_66 (mirror_66 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_66 : forall t : tree_66, size_66 (mirror_66 t) = size_66 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_66 : forall n, mirror_66 (leaf_66 n) = leaf_66 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_066.

