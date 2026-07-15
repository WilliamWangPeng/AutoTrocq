(* V63 library-style representation-migration module *)
(* PATTERN: tree-mirror *)
(* TRANSFER_SHAPE: structural involution *)
(* OBLIGATIONS: 3 *)

Module V63_tree_mirror_046.
Require Import Coq.Arith.PeanoNat.

Inductive tree_46 :=
| leaf_46 : nat -> tree_46
| node_46 : tree_46 -> tree_46 -> tree_46.

Fixpoint mirror_46 (t : tree_46) : tree_46 :=
  match t with
  | leaf_46 n => leaf_46 n
  | node_46 l r => node_46 (mirror_46 r) (mirror_46 l)
  end.

Fixpoint size_46 (t : tree_46) : nat :=
  match t with
  | leaf_46 _ => 1
  | node_46 l r => S (size_46 l + size_46 r)
  end.

Theorem mirror_involutive_46 : forall t : tree_46, mirror_46 (mirror_46 t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem mirror_size_46 : forall t : tree_46, size_46 (mirror_46 t) = size_46 t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; try reflexivity.
  now rewrite IHl, IHr, Nat.add_comm.
Qed.

Theorem mirror_leaf_46 : forall n, mirror_46 (leaf_46 n) = leaf_46 n.
Proof. reflexivity. Qed.
End V63_tree_mirror_046.

