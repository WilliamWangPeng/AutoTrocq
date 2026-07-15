(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_047.
Require Import Coq.Arith.PeanoNat.

Inductive tree_47 :=
| leaf_47 : nat -> tree_47
| node_47 : tree_47 -> tree_47 -> tree_47.

Fixpoint mirror_47 (t : tree_47) : tree_47 :=
  match t with
  | leaf_47 n => leaf_47 n
  | node_47 l r => node_47 (mirror_47 r) (mirror_47 l)
  end.

Fixpoint size_47 (t : tree_47) : nat :=
  match t with
  | leaf_47 _ => 1
  | node_47 l r => S (size_47 l + size_47 r)
  end.

Theorem mirror_involutive_47 : forall t : tree_47, mirror_47 (mirror_47 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_47 : forall t : tree_47, size_47 (mirror_47 t) = size_47 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_47 : forall n, mirror_47 (leaf_47 n) = leaf_47 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_047.

