(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_071.
Require Import Coq.Arith.PeanoNat.

Inductive tree_71 :=
| leaf_71 : nat -> tree_71
| node_71 : tree_71 -> tree_71 -> tree_71.

Fixpoint mirror_71 (t : tree_71) : tree_71 :=
  match t with
  | leaf_71 n => leaf_71 n
  | node_71 l r => node_71 (mirror_71 r) (mirror_71 l)
  end.

Fixpoint size_71 (t : tree_71) : nat :=
  match t with
  | leaf_71 _ => 1
  | node_71 l r => S (size_71 l + size_71 r)
  end.

Theorem mirror_involutive_71 : forall t : tree_71, mirror_71 (mirror_71 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_71 : forall t : tree_71, size_71 (mirror_71 t) = size_71 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_71 : forall n, mirror_71 (leaf_71 n) = leaf_71 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_071.

