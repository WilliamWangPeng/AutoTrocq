Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_ASSOC_LIST_010.
Fixpoint v70_lookup_10 (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else v70_lookup_10 k rest
  end.

Definition v70_update_10 (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem v70_lookup_update_same_10 : forall k v xs,
  v70_lookup_10 k (v70_update_10 k v xs) = Some v.
Proof.
  intros k v xs. unfold v70_update_10. simpl. now rewrite Nat.eqb_refl.
Qed.

Theorem v70_lookup_empty_10 : forall k : nat,
  v70_lookup_10 k [] = None.
Proof.
  reflexivity.
Qed.
End V70_ASSOC_LIST_010.

