(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_058.
Require Import Coq.Arith.PeanoNat.

Inductive tree_58 :=
| leaf_58 : nat -> tree_58
| node_58 : tree_58 -> tree_58 -> tree_58.

Fixpoint mirror_58 (t : tree_58) : tree_58 :=
  match t with
  | leaf_58 n => leaf_58 n
  | node_58 l r => node_58 (mirror_58 r) (mirror_58 l)
  end.

Fixpoint size_58 (t : tree_58) : nat :=
  match t with
  | leaf_58 _ => 1
  | node_58 l r => S (size_58 l + size_58 r)
  end.

Theorem mirror_involutive_58 : forall t : tree_58, mirror_58 (mirror_58 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_58 : forall t : tree_58, size_58 (mirror_58 t) = size_58 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_58 : forall n, mirror_58 (leaf_58 n) = leaf_58 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_058.

