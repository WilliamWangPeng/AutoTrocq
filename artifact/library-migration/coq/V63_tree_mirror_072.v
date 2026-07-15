(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_072.
Require Import Coq.Arith.PeanoNat.

Inductive tree_72 :=
| leaf_72 : nat -> tree_72
| node_72 : tree_72 -> tree_72 -> tree_72.

Fixpoint mirror_72 (t : tree_72) : tree_72 :=
  match t with
  | leaf_72 n => leaf_72 n
  | node_72 l r => node_72 (mirror_72 r) (mirror_72 l)
  end.

Fixpoint size_72 (t : tree_72) : nat :=
  match t with
  | leaf_72 _ => 1
  | node_72 l r => S (size_72 l + size_72 r)
  end.

Theorem mirror_involutive_72 : forall t : tree_72, mirror_72 (mirror_72 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_72 : forall t : tree_72, size_72 (mirror_72 t) = size_72 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_72 : forall n, mirror_72 (leaf_72 n) = leaf_72 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_072.

