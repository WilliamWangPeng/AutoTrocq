(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_006.
Require Import Coq.Arith.PeanoNat.

Inductive tree_6 :=
| leaf_6 : nat -> tree_6
| node_6 : tree_6 -> tree_6 -> tree_6.

Fixpoint mirror_6 (t : tree_6) : tree_6 :=
  match t with
  | leaf_6 n => leaf_6 n
  | node_6 l r => node_6 (mirror_6 r) (mirror_6 l)
  end.

Fixpoint size_6 (t : tree_6) : nat :=
  match t with
  | leaf_6 _ => 1
  | node_6 l r => S (size_6 l + size_6 r)
  end.

Theorem mirror_involutive_6 : forall t : tree_6, mirror_6 (mirror_6 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_6 : forall t : tree_6, size_6 (mirror_6 t) = size_6 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_6 : forall n, mirror_6 (leaf_6 n) = leaf_6 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_006.

