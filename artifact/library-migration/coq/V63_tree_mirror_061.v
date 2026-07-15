(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_061.
Require Import Coq.Arith.PeanoNat.

Inductive tree_61 :=
| leaf_61 : nat -> tree_61
| node_61 : tree_61 -> tree_61 -> tree_61.

Fixpoint mirror_61 (t : tree_61) : tree_61 :=
  match t with
  | leaf_61 n => leaf_61 n
  | node_61 l r => node_61 (mirror_61 r) (mirror_61 l)
  end.

Fixpoint size_61 (t : tree_61) : nat :=
  match t with
  | leaf_61 _ => 1
  | node_61 l r => S (size_61 l + size_61 r)
  end.

Theorem mirror_involutive_61 : forall t : tree_61, mirror_61 (mirror_61 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_61 : forall t : tree_61, size_61 (mirror_61 t) = size_61 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_61 : forall n, mirror_61 (leaf_61 n) = leaf_61 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_061.

