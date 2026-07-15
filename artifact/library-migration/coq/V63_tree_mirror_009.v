(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_009.
Require Import Coq.Arith.PeanoNat.

Inductive tree_9 :=
| leaf_9 : nat -> tree_9
| node_9 : tree_9 -> tree_9 -> tree_9.

Fixpoint mirror_9 (t : tree_9) : tree_9 :=
  match t with
  | leaf_9 n => leaf_9 n
  | node_9 l r => node_9 (mirror_9 r) (mirror_9 l)
  end.

Fixpoint size_9 (t : tree_9) : nat :=
  match t with
  | leaf_9 _ => 1
  | node_9 l r => S (size_9 l + size_9 r)
  end.

Theorem mirror_involutive_9 : forall t : tree_9, mirror_9 (mirror_9 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_9 : forall t : tree_9, size_9 (mirror_9 t) = size_9 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_9 : forall n, mirror_9 (leaf_9 n) = leaf_9 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_009.

