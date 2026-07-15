(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_032.
Require Import Coq.Arith.PeanoNat.

Inductive tree_32 :=
| leaf_32 : nat -> tree_32
| node_32 : tree_32 -> tree_32 -> tree_32.

Fixpoint mirror_32 (t : tree_32) : tree_32 :=
  match t with
  | leaf_32 n => leaf_32 n
  | node_32 l r => node_32 (mirror_32 r) (mirror_32 l)
  end.

Fixpoint size_32 (t : tree_32) : nat :=
  match t with
  | leaf_32 _ => 1
  | node_32 l r => S (size_32 l + size_32 r)
  end.

Theorem mirror_involutive_32 : forall t : tree_32, mirror_32 (mirror_32 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_32 : forall t : tree_32, size_32 (mirror_32 t) = size_32 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_32 : forall n, mirror_32 (leaf_32 n) = leaf_32 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_032.

