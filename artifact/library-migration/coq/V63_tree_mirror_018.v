(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_018.
Require Import Coq.Arith.PeanoNat.

Inductive tree_18 :=
| leaf_18 : nat -> tree_18
| node_18 : tree_18 -> tree_18 -> tree_18.

Fixpoint mirror_18 (t : tree_18) : tree_18 :=
  match t with
  | leaf_18 n => leaf_18 n
  | node_18 l r => node_18 (mirror_18 r) (mirror_18 l)
  end.

Fixpoint size_18 (t : tree_18) : nat :=
  match t with
  | leaf_18 _ => 1
  | node_18 l r => S (size_18 l + size_18 r)
  end.

Theorem mirror_involutive_18 : forall t : tree_18, mirror_18 (mirror_18 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_18 : forall t : tree_18, size_18 (mirror_18 t) = size_18 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_18 : forall n, mirror_18 (leaf_18 n) = leaf_18 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_018.

