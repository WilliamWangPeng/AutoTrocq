(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_038.
Require Import Coq.Arith.PeanoNat.

Inductive tree_38 :=
| leaf_38 : nat -> tree_38
| node_38 : tree_38 -> tree_38 -> tree_38.

Fixpoint mirror_38 (t : tree_38) : tree_38 :=
  match t with
  | leaf_38 n => leaf_38 n
  | node_38 l r => node_38 (mirror_38 r) (mirror_38 l)
  end.

Fixpoint size_38 (t : tree_38) : nat :=
  match t with
  | leaf_38 _ => 1
  | node_38 l r => S (size_38 l + size_38 r)
  end.

Theorem mirror_involutive_38 : forall t : tree_38, mirror_38 (mirror_38 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_38 : forall t : tree_38, size_38 (mirror_38 t) = size_38 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_38 : forall n, mirror_38 (leaf_38 n) = leaf_38 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_038.

