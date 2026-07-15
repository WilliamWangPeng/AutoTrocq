(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_056.
Require Import Coq.Arith.PeanoNat.

Inductive tree_56 :=
| leaf_56 : nat -> tree_56
| node_56 : tree_56 -> tree_56 -> tree_56.

Fixpoint mirror_56 (t : tree_56) : tree_56 :=
  match t with
  | leaf_56 n => leaf_56 n
  | node_56 l r => node_56 (mirror_56 r) (mirror_56 l)
  end.

Fixpoint size_56 (t : tree_56) : nat :=
  match t with
  | leaf_56 _ => 1
  | node_56 l r => S (size_56 l + size_56 r)
  end.

Theorem mirror_involutive_56 : forall t : tree_56, mirror_56 (mirror_56 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_56 : forall t : tree_56, size_56 (mirror_56 t) = size_56 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_56 : forall n, mirror_56 (leaf_56 n) = leaf_56 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_056.

