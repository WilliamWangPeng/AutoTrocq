(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_033.
Require Import Coq.Arith.PeanoNat.

Inductive tree_33 :=
| leaf_33 : nat -> tree_33
| node_33 : tree_33 -> tree_33 -> tree_33.

Fixpoint mirror_33 (t : tree_33) : tree_33 :=
  match t with
  | leaf_33 n => leaf_33 n
  | node_33 l r => node_33 (mirror_33 r) (mirror_33 l)
  end.

Fixpoint size_33 (t : tree_33) : nat :=
  match t with
  | leaf_33 _ => 1
  | node_33 l r => S (size_33 l + size_33 r)
  end.

Theorem mirror_involutive_33 : forall t : tree_33, mirror_33 (mirror_33 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_33 : forall t : tree_33, size_33 (mirror_33 t) = size_33 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_33 : forall n, mirror_33 (leaf_33 n) = leaf_33 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_033.

