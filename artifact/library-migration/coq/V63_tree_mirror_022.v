(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_022.
Require Import Coq.Arith.PeanoNat.

Inductive tree_22 :=
| leaf_22 : nat -> tree_22
| node_22 : tree_22 -> tree_22 -> tree_22.

Fixpoint mirror_22 (t : tree_22) : tree_22 :=
  match t with
  | leaf_22 n => leaf_22 n
  | node_22 l r => node_22 (mirror_22 r) (mirror_22 l)
  end.

Fixpoint size_22 (t : tree_22) : nat :=
  match t with
  | leaf_22 _ => 1
  | node_22 l r => S (size_22 l + size_22 r)
  end.

Theorem mirror_involutive_22 : forall t : tree_22, mirror_22 (mirror_22 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_22 : forall t : tree_22, size_22 (mirror_22 t) = size_22 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_22 : forall n, mirror_22 (leaf_22 n) = leaf_22 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_022.

