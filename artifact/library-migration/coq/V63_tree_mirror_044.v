(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_044.
Require Import Coq.Arith.PeanoNat.

Inductive tree_44 :=
| leaf_44 : nat -> tree_44
| node_44 : tree_44 -> tree_44 -> tree_44.

Fixpoint mirror_44 (t : tree_44) : tree_44 :=
  match t with
  | leaf_44 n => leaf_44 n
  | node_44 l r => node_44 (mirror_44 r) (mirror_44 l)
  end.

Fixpoint size_44 (t : tree_44) : nat :=
  match t with
  | leaf_44 _ => 1
  | node_44 l r => S (size_44 l + size_44 r)
  end.

Theorem mirror_involutive_44 : forall t : tree_44, mirror_44 (mirror_44 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_44 : forall t : tree_44, size_44 (mirror_44 t) = size_44 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_44 : forall n, mirror_44 (leaf_44 n) = leaf_44 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_044.

