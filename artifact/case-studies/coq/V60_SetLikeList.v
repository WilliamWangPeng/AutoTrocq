(* V60 case-study module *)
(* PATTERN: set-like list *)
(* TRANSFER_SHAPE: membership preservation *)

Module V60_SetLikeList.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Lists.List.
Require Import Coq.micromega.Lia.
Import ListNotations.

Fixpoint member (x : nat) (xs : list nat) : bool :=
  match xs with
  | [] => false
  | y :: ys => if Nat.eqb x y then true else member x ys
  end.

Definition insert (x : nat) (xs : list nat) : list nat :=
  if member x xs then xs else x :: xs.

Theorem member_insert : forall x xs, member x (insert x xs) = true.
Proof.
  intros x xs.
  unfold insert.
  destruct (member x xs) eqn:H.
  - exact H.
  - simpl. now rewrite Nat.eqb_refl.
Qed.

Theorem member_cons_other :
  forall x y xs, Nat.eqb x y = false -> member x (y :: xs) = member x xs.
Proof.
  intros x y xs H.
  simpl.
  now rewrite H.
Qed.

Theorem insert_length_bound : forall x xs, length (insert x xs) <= S (length xs).
Proof.
  intros x xs.
  unfold insert.
  destruct (member x xs); simpl; lia.
Qed.
End V60_SetLikeList.

