Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_ASSOC_LIST_049.
Fixpoint v70_lookup_49 (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else v70_lookup_49 k rest
  end.

Definition v70_update_49 (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem v70_lookup_update_same_49 : forall k v xs,
  v70_lookup_49 k (v70_update_49 k v xs) = Some v.
Proof.
  intros k v xs. unfold v70_update_49. simpl. now rewrite Nat.eqb_refl.
Qed.

Theorem v70_lookup_empty_49 : forall k : nat,
  v70_lookup_49 k [] = None.
Proof.
  reflexivity.
Qed.
End V70_ASSOC_LIST_049.

