(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_019.
Require Import Coq.Arith.PeanoNat.

Inductive tree_19 :=
| leaf_19 : nat -> tree_19
| node_19 : tree_19 -> tree_19 -> tree_19.

Fixpoint mirror_19 (t : tree_19) : tree_19 :=
  match t with
  | leaf_19 n => leaf_19 n
  | node_19 l r => node_19 (mirror_19 r) (mirror_19 l)
  end.

Fixpoint size_19 (t : tree_19) : nat :=
  match t with
  | leaf_19 _ => 1
  | node_19 l r => S (size_19 l + size_19 r)
  end.

Theorem mirror_involutive_19 : forall t : tree_19, mirror_19 (mirror_19 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_19 : forall t : tree_19, size_19 (mirror_19 t) = size_19 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_19 : forall n, mirror_19 (leaf_19 n) = leaf_19 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_019.

