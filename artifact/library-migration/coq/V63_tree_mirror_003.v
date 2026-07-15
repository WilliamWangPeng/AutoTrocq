(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_003.
Require Import Coq.Arith.PeanoNat.

Inductive tree_3 :=
| leaf_3 : nat -> tree_3
| node_3 : tree_3 -> tree_3 -> tree_3.

Fixpoint mirror_3 (t : tree_3) : tree_3 :=
  match t with
  | leaf_3 n => leaf_3 n
  | node_3 l r => node_3 (mirror_3 r) (mirror_3 l)
  end.

Fixpoint size_3 (t : tree_3) : nat :=
  match t with
  | leaf_3 _ => 1
  | node_3 l r => S (size_3 l + size_3 r)
  end.

Theorem mirror_involutive_3 : forall t : tree_3, mirror_3 (mirror_3 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_3 : forall t : tree_3, size_3 (mirror_3 t) = size_3 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_3 : forall n, mirror_3 (leaf_3 n) = leaf_3 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_003.

