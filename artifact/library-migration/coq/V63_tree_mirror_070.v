(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_070.
Require Import Coq.Arith.PeanoNat.

Inductive tree_70 :=
| leaf_70 : nat -> tree_70
| node_70 : tree_70 -> tree_70 -> tree_70.

Fixpoint mirror_70 (t : tree_70) : tree_70 :=
  match t with
  | leaf_70 n => leaf_70 n
  | node_70 l r => node_70 (mirror_70 r) (mirror_70 l)
  end.

Fixpoint size_70 (t : tree_70) : nat :=
  match t with
  | leaf_70 _ => 1
  | node_70 l r => S (size_70 l + size_70 r)
  end.

Theorem mirror_involutive_70 : forall t : tree_70, mirror_70 (mirror_70 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_70 : forall t : tree_70, size_70 (mirror_70 t) = size_70 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_70 : forall n, mirror_70 (leaf_70 n) = leaf_70 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_070.

