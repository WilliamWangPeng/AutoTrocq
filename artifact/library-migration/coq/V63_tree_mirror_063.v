(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_063.
Require Import Coq.Arith.PeanoNat.

Inductive tree_63 :=
| leaf_63 : nat -> tree_63
| node_63 : tree_63 -> tree_63 -> tree_63.

Fixpoint mirror_63 (t : tree_63) : tree_63 :=
  match t with
  | leaf_63 n => leaf_63 n
  | node_63 l r => node_63 (mirror_63 r) (mirror_63 l)
  end.

Fixpoint size_63 (t : tree_63) : nat :=
  match t with
  | leaf_63 _ => 1
  | node_63 l r => S (size_63 l + size_63 r)
  end.

Theorem mirror_involutive_63 : forall t : tree_63, mirror_63 (mirror_63 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_63 : forall t : tree_63, size_63 (mirror_63 t) = size_63 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_63 : forall n, mirror_63 (leaf_63 n) = leaf_63 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_063.

