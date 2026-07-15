(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_055.
Require Import Coq.Arith.PeanoNat.

Inductive tree_55 :=
| leaf_55 : nat -> tree_55
| node_55 : tree_55 -> tree_55 -> tree_55.

Fixpoint mirror_55 (t : tree_55) : tree_55 :=
  match t with
  | leaf_55 n => leaf_55 n
  | node_55 l r => node_55 (mirror_55 r) (mirror_55 l)
  end.

Fixpoint size_55 (t : tree_55) : nat :=
  match t with
  | leaf_55 _ => 1
  | node_55 l r => S (size_55 l + size_55 r)
  end.

Theorem mirror_involutive_55 : forall t : tree_55, mirror_55 (mirror_55 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_55 : forall t : tree_55, size_55 (mirror_55 t) = size_55 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_55 : forall n, mirror_55 (leaf_55 n) = leaf_55 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_055.

