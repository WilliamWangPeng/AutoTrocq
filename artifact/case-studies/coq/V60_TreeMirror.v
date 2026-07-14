(* V60 case-study module *)
(* PATTERN: tree representation *)
(* TRANSFER_SHAPE: involution *)

Module V60_TreeMirror.
Require Import Coq.Arith.PeanoNat.

Inductive tree :=
| Leaf : nat -> tree
| Node : tree -> tree -> tree.

Fixpoint mirror (t : tree) : tree :=
  match t with
  | Leaf n => Leaf n
  | Node l r => Node (mirror r) (mirror l)
  end.

Fixpoint leaves (t : tree) : nat :=
  match t with
  | Leaf _ => 1
  | Node l r => leaves l + leaves r
  end.

Theorem mirror_involutive : forall t : tree, mirror (mirror t) = t.
Proof.
  induction t as [n|l IHl r IHr]; simpl; now rewrite ?IHl, ?IHr.
Qed.

Theorem leaves_mirror : forall t : tree, leaves (mirror t) = leaves t.
Proof.
  induction t as [n|l IHl r IHr]; simpl.
  - reflexivity.
  - rewrite IHl, IHr.
    now rewrite Nat.add_comm.
Qed.

Theorem mirror_leaf : forall n, mirror (Leaf n) = Leaf n.
Proof. reflexivity. Qed.
End V60_TreeMirror.

