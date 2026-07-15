(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_052.
Require Import Coq.Arith.PeanoNat.

Inductive tree_52 :=
| leaf_52 : nat -> tree_52
| node_52 : tree_52 -> tree_52 -> tree_52.

Fixpoint mirror_52 (t : tree_52) : tree_52 :=
  match t with
  | leaf_52 n => leaf_52 n
  | node_52 l r => node_52 (mirror_52 r) (mirror_52 l)
  end.

Fixpoint size_52 (t : tree_52) : nat :=
  match t with
  | leaf_52 _ => 1
  | node_52 l r => S (size_52 l + size_52 r)
  end.

Theorem mirror_involutive_52 : forall t : tree_52, mirror_52 (mirror_52 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_52 : forall t : tree_52, size_52 (mirror_52 t) = size_52 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_52 : forall n, mirror_52 (leaf_52 n) = leaf_52 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_052.

