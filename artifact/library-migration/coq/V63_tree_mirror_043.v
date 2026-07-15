(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_043.
Require Import Coq.Arith.PeanoNat.

Inductive tree_43 :=
| leaf_43 : nat -> tree_43
| node_43 : tree_43 -> tree_43 -> tree_43.

Fixpoint mirror_43 (t : tree_43) : tree_43 :=
  match t with
  | leaf_43 n => leaf_43 n
  | node_43 l r => node_43 (mirror_43 r) (mirror_43 l)
  end.

Fixpoint size_43 (t : tree_43) : nat :=
  match t with
  | leaf_43 _ => 1
  | node_43 l r => S (size_43 l + size_43 r)
  end.

Theorem mirror_involutive_43 : forall t : tree_43, mirror_43 (mirror_43 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_43 : forall t : tree_43, size_43 (mirror_43 t) = size_43 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_43 : forall n, mirror_43 (leaf_43 n) = leaf_43 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_043.

