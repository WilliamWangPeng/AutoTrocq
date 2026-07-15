(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_054.
Require Import Coq.Arith.PeanoNat.

Inductive tree_54 :=
| leaf_54 : nat -> tree_54
| node_54 : tree_54 -> tree_54 -> tree_54.

Fixpoint mirror_54 (t : tree_54) : tree_54 :=
  match t with
  | leaf_54 n => leaf_54 n
  | node_54 l r => node_54 (mirror_54 r) (mirror_54 l)
  end.

Fixpoint size_54 (t : tree_54) : nat :=
  match t with
  | leaf_54 _ => 1
  | node_54 l r => S (size_54 l + size_54 r)
  end.

Theorem mirror_involutive_54 : forall t : tree_54, mirror_54 (mirror_54 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_54 : forall t : tree_54, size_54 (mirror_54 t) = size_54 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_54 : forall n, mirror_54 (leaf_54 n) = leaf_54 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_054.

