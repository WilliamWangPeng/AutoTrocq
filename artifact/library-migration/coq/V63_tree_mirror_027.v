(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_027.
Require Import Coq.Arith.PeanoNat.

Inductive tree_27 :=
| leaf_27 : nat -> tree_27
| node_27 : tree_27 -> tree_27 -> tree_27.

Fixpoint mirror_27 (t : tree_27) : tree_27 :=
  match t with
  | leaf_27 n => leaf_27 n
  | node_27 l r => node_27 (mirror_27 r) (mirror_27 l)
  end.

Fixpoint size_27 (t : tree_27) : nat :=
  match t with
  | leaf_27 _ => 1
  | node_27 l r => S (size_27 l + size_27 r)
  end.

Theorem mirror_involutive_27 : forall t : tree_27, mirror_27 (mirror_27 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_27 : forall t : tree_27, size_27 (mirror_27 t) = size_27 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_27 : forall n, mirror_27 (leaf_27 n) = leaf_27 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_027.

