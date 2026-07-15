(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_035.
Require Import Coq.Arith.PeanoNat.

Inductive tree_35 :=
| leaf_35 : nat -> tree_35
| node_35 : tree_35 -> tree_35 -> tree_35.

Fixpoint mirror_35 (t : tree_35) : tree_35 :=
  match t with
  | leaf_35 n => leaf_35 n
  | node_35 l r => node_35 (mirror_35 r) (mirror_35 l)
  end.

Fixpoint size_35 (t : tree_35) : nat :=
  match t with
  | leaf_35 _ => 1
  | node_35 l r => S (size_35 l + size_35 r)
  end.

Theorem mirror_involutive_35 : forall t : tree_35, mirror_35 (mirror_35 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_35 : forall t : tree_35, size_35 (mirror_35 t) = size_35 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_35 : forall n, mirror_35 (leaf_35 n) = leaf_35 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_035.

