(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_053.
Require Import Coq.Arith.PeanoNat.

Inductive tree_53 :=
| leaf_53 : nat -> tree_53
| node_53 : tree_53 -> tree_53 -> tree_53.

Fixpoint mirror_53 (t : tree_53) : tree_53 :=
  match t with
  | leaf_53 n => leaf_53 n
  | node_53 l r => node_53 (mirror_53 r) (mirror_53 l)
  end.

Fixpoint size_53 (t : tree_53) : nat :=
  match t with
  | leaf_53 _ => 1
  | node_53 l r => S (size_53 l + size_53 r)
  end.

Theorem mirror_involutive_53 : forall t : tree_53, mirror_53 (mirror_53 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_53 : forall t : tree_53, size_53 (mirror_53 t) = size_53 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_53 : forall n, mirror_53 (leaf_53 n) = leaf_53 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_053.

