(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_067.
Require Import Coq.Arith.PeanoNat.

Inductive tree_67 :=
| leaf_67 : nat -> tree_67
| node_67 : tree_67 -> tree_67 -> tree_67.

Fixpoint mirror_67 (t : tree_67) : tree_67 :=
  match t with
  | leaf_67 n => leaf_67 n
  | node_67 l r => node_67 (mirror_67 r) (mirror_67 l)
  end.

Fixpoint size_67 (t : tree_67) : nat :=
  match t with
  | leaf_67 _ => 1
  | node_67 l r => S (size_67 l + size_67 r)
  end.

Theorem mirror_involutive_67 : forall t : tree_67, mirror_67 (mirror_67 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_67 : forall t : tree_67, size_67 (mirror_67 t) = size_67 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_67 : forall n, mirror_67 (leaf_67 n) = leaf_67 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_067.

