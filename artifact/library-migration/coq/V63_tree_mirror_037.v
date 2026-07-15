(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_037.
Require Import Coq.Arith.PeanoNat.

Inductive tree_37 :=
| leaf_37 : nat -> tree_37
| node_37 : tree_37 -> tree_37 -> tree_37.

Fixpoint mirror_37 (t : tree_37) : tree_37 :=
  match t with
  | leaf_37 n => leaf_37 n
  | node_37 l r => node_37 (mirror_37 r) (mirror_37 l)
  end.

Fixpoint size_37 (t : tree_37) : nat :=
  match t with
  | leaf_37 _ => 1
  | node_37 l r => S (size_37 l + size_37 r)
  end.

Theorem mirror_involutive_37 : forall t : tree_37, mirror_37 (mirror_37 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_37 : forall t : tree_37, size_37 (mirror_37 t) = size_37 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_37 : forall n, mirror_37 (leaf_37 n) = leaf_37 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_037.

