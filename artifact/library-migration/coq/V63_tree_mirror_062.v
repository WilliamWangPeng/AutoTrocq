(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_062.
Require Import Coq.Arith.PeanoNat.

Inductive tree_62 :=
| leaf_62 : nat -> tree_62
| node_62 : tree_62 -> tree_62 -> tree_62.

Fixpoint mirror_62 (t : tree_62) : tree_62 :=
  match t with
  | leaf_62 n => leaf_62 n
  | node_62 l r => node_62 (mirror_62 r) (mirror_62 l)
  end.

Fixpoint size_62 (t : tree_62) : nat :=
  match t with
  | leaf_62 _ => 1
  | node_62 l r => S (size_62 l + size_62 r)
  end.

Theorem mirror_involutive_62 : forall t : tree_62, mirror_62 (mirror_62 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_62 : forall t : tree_62, size_62 (mirror_62 t) = size_62 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_62 : forall n, mirror_62 (leaf_62 n) = leaf_62 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_062.

