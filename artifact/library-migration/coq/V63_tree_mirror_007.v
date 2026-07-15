(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_007.
Require Import Coq.Arith.PeanoNat.

Inductive tree_7 :=
| leaf_7 : nat -> tree_7
| node_7 : tree_7 -> tree_7 -> tree_7.

Fixpoint mirror_7 (t : tree_7) : tree_7 :=
  match t with
  | leaf_7 n => leaf_7 n
  | node_7 l r => node_7 (mirror_7 r) (mirror_7 l)
  end.

Fixpoint size_7 (t : tree_7) : nat :=
  match t with
  | leaf_7 _ => 1
  | node_7 l r => S (size_7 l + size_7 r)
  end.

Theorem mirror_involutive_7 : forall t : tree_7, mirror_7 (mirror_7 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_7 : forall t : tree_7, size_7 (mirror_7 t) = size_7 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_7 : forall n, mirror_7 (leaf_7 n) = leaf_7 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_007.

