(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_025.
Require Import Coq.Arith.PeanoNat.

Inductive tree_25 :=
| leaf_25 : nat -> tree_25
| node_25 : tree_25 -> tree_25 -> tree_25.

Fixpoint mirror_25 (t : tree_25) : tree_25 :=
  match t with
  | leaf_25 n => leaf_25 n
  | node_25 l r => node_25 (mirror_25 r) (mirror_25 l)
  end.

Fixpoint size_25 (t : tree_25) : nat :=
  match t with
  | leaf_25 _ => 1
  | node_25 l r => S (size_25 l + size_25 r)
  end.

Theorem mirror_involutive_25 : forall t : tree_25, mirror_25 (mirror_25 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_25 : forall t : tree_25, size_25 (mirror_25 t) = size_25 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_25 : forall n, mirror_25 (leaf_25 n) = leaf_25 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_025.

