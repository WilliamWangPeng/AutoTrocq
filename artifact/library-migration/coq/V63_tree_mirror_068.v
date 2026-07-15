(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_068.
Require Import Coq.Arith.PeanoNat.

Inductive tree_68 :=
| leaf_68 : nat -> tree_68
| node_68 : tree_68 -> tree_68 -> tree_68.

Fixpoint mirror_68 (t : tree_68) : tree_68 :=
  match t with
  | leaf_68 n => leaf_68 n
  | node_68 l r => node_68 (mirror_68 r) (mirror_68 l)
  end.

Fixpoint size_68 (t : tree_68) : nat :=
  match t with
  | leaf_68 _ => 1
  | node_68 l r => S (size_68 l + size_68 r)
  end.

Theorem mirror_involutive_68 : forall t : tree_68, mirror_68 (mirror_68 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_68 : forall t : tree_68, size_68 (mirror_68 t) = size_68 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_68 : forall n, mirror_68 (leaf_68 n) = leaf_68 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_068.

