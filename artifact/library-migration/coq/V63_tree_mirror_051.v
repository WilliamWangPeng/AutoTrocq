(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_051.
Require Import Coq.Arith.PeanoNat.

Inductive tree_51 :=
| leaf_51 : nat -> tree_51
| node_51 : tree_51 -> tree_51 -> tree_51.

Fixpoint mirror_51 (t : tree_51) : tree_51 :=
  match t with
  | leaf_51 n => leaf_51 n
  | node_51 l r => node_51 (mirror_51 r) (mirror_51 l)
  end.

Fixpoint size_51 (t : tree_51) : nat :=
  match t with
  | leaf_51 _ => 1
  | node_51 l r => S (size_51 l + size_51 r)
  end.

Theorem mirror_involutive_51 : forall t : tree_51, mirror_51 (mirror_51 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_51 : forall t : tree_51, size_51 (mirror_51 t) = size_51 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_51 : forall n, mirror_51 (leaf_51 n) = leaf_51 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_051.

