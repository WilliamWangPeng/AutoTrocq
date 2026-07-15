(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_045.
Require Import Coq.Arith.PeanoNat.

Inductive tree_45 :=
| leaf_45 : nat -> tree_45
| node_45 : tree_45 -> tree_45 -> tree_45.

Fixpoint mirror_45 (t : tree_45) : tree_45 :=
  match t with
  | leaf_45 n => leaf_45 n
  | node_45 l r => node_45 (mirror_45 r) (mirror_45 l)
  end.

Fixpoint size_45 (t : tree_45) : nat :=
  match t with
  | leaf_45 _ => 1
  | node_45 l r => S (size_45 l + size_45 r)
  end.

Theorem mirror_involutive_45 : forall t : tree_45, mirror_45 (mirror_45 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_45 : forall t : tree_45, size_45 (mirror_45 t) = size_45 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_45 : forall n, mirror_45 (leaf_45 n) = leaf_45 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_045.

