(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_034.
Require Import Coq.Arith.PeanoNat.

Inductive tree_34 :=
| leaf_34 : nat -> tree_34
| node_34 : tree_34 -> tree_34 -> tree_34.

Fixpoint mirror_34 (t : tree_34) : tree_34 :=
  match t with
  | leaf_34 n => leaf_34 n
  | node_34 l r => node_34 (mirror_34 r) (mirror_34 l)
  end.

Fixpoint size_34 (t : tree_34) : nat :=
  match t with
  | leaf_34 _ => 1
  | node_34 l r => S (size_34 l + size_34 r)
  end.

Theorem mirror_involutive_34 : forall t : tree_34, mirror_34 (mirror_34 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_34 : forall t : tree_34, size_34 (mirror_34 t) = size_34 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_34 : forall n, mirror_34 (leaf_34 n) = leaf_34 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_034.

